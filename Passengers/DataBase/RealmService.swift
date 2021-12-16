//
//  RealmService.swift
//  Passengers
//
//  Created by Павел Бескоровайный on 15.12.2021.
//

import Foundation
import RealmSwift

class RealmService {
  static let shared = RealmService()
  
  private var db: Realm = try! Realm()
  public var allTrips: [Trip] {
    return db.objects(Trip.self).toArray()
  }
  public var allPassengers: [Passenger] {
    return db.objects(Passenger.self).toArray()
  }
  
  private init() {
    do {
      var realm: Realm
      try realm = Realm()
      self.db = realm
    } catch let error {
      //MARK: need to add base alert logic for app
      print(error.localizedDescription)
    }
  }
  
  public func addTripWithPassenger(timeStamp: Int, name: String, phone: String) {
    let trip = Trip()
    trip.timeStamp = timeStamp
    let passenger = Passenger()
    passenger.name = name
    passenger.phone = phone
    
    try! db.write {
      if let existingPassenger = allPassengers.filter({$0.phone == passenger.phone}).first {
        existingPassenger.name = passenger.name
      } else {
        db.add(passenger)
      }
      
      if let existingTrip = allTrips.filter({$0.timeStamp == trip.timeStamp}).first {
        existingTrip.passengers.append(passenger)
      } else {
        trip.passengers.append(passenger)
        db.add(trip)
      }
    }
  }
}

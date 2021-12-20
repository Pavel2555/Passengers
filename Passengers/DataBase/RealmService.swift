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
    let trip = self.findOrCreateTrip(timeStamp: timeStamp)
    let passenger = self.findOrCreatePassenger(name: name, phone: phone)
    try! db.write {
      if !trip.passengers.contains(where: { $0 == passenger } ) {
        trip.passengers.append(passenger)
      }
    }
    Notification.Name.dataBaseWasChanged.post()
  }
  
  public func findOrCreateTrip(timeStamp: Int) -> Trip {
    try! db.write {
      if let existingTrip = allTrips.filter({$0.timeStamp == timeStamp}).first {
        return existingTrip
      } else {
        let trip = Trip()
        trip.timeStamp = timeStamp
        db.add(trip)
        Notification.Name.dataBaseWasChanged.post()
        return trip
      }
    }
//    Notification.Name.dataBaseWasChanged.post()
  }
  
  public func findOrCreatePassenger(name: String, phone: String) -> Passenger {
    try! db.write {
      if let existingPassenger = allPassengers.filter({$0.phone == phone}).first {
        existingPassenger.name = name
        Notification.Name.dataBaseWasChanged.post()
        return existingPassenger
      } else {
        let passenger = Passenger()
        passenger.name = name
        passenger.phone = phone
        db.add(passenger)
        Notification.Name.dataBaseWasChanged.post()
        return passenger
      }
    }
   
  }
  
  public func deletePassengerFromTrip(_ pass: Passenger, from trip: Trip) {
    if let index = trip.passengers.firstIndex(of: pass) {
      try! db.write {
        trip.passengers.remove(at: index)
        Notification.Name.dataBaseWasChanged.post()
      }
    }
  }
  
  public func getCountOfTripsForPassenger(_ pass: Passenger) -> Int {
   var count = 0
    allTrips.forEach({
      if $0.passengers.contains(where: {$0 == pass}) {
        count += 1
      }
    })
    return count
  }
}

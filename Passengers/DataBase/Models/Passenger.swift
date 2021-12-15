//
//  Passenger.swift
//  Passengers
//
//  Created by Павел Бескоровайный on 13.12.2021.
//

import Foundation
import RealmSwift

class Passenger: Object {
  @Persisted var name: String
  @Persisted(primaryKey: true) var phone: String
  
  let trip = LinkingObjects.init(fromType: Trip.self, property: "passengers")
}


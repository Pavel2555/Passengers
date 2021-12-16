//
//  Trip.swift
//  Passengers
//
//  Created by Павел Бескоровайный on 13.12.2021.
//

import Foundation
import RealmSwift

class Trip: Object {
  @Persisted(primaryKey: true) var timeStamp: Int
  
  @Persisted var passengers = List<Passenger>()
}

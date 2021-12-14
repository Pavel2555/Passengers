//
//  Date+Extension.swift
//  PassengersRealm
//
//  Created by Павел Бескоровайный on 24.11.2021.
//

import Foundation
extension Date {
  
  func toString() -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd-MMM-yyyy, HH:mm"
    return dateFormatter.string(from: self)
  }
  
  var timeIntervalSince1970inMilliseconds: TimeInterval {
    return self.timeIntervalSince1970 * 1000
  }
  
  var milisecondsSince1970: Int {
    return Int(timeIntervalSince1970inMilliseconds)
  }
  
  init(milisecondsSince1970: Int) {
    self = Date(timeIntervalSince1970: Double(milisecondsSince1970) / 1000)
  }
}

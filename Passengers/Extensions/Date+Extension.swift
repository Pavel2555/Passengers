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
    dateFormatter.dateFormat = "E, MMM d, yyyy"
    dateFormatter.locale = Locale(identifier: "ru")
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
  
  public func setTime(hour: Int, min: Int = 0, sec: Int = 0) -> Date {
    let x: Set<Calendar.Component> = [.year, .month, .day, .hour, .minute, .second]
    let cal = Calendar.current
    var components = cal.dateComponents(x, from: self)
    
    components.hour = hour
    components.minute = min
    components.second = sec
    
    return cal.date(from: components) ?? Date()
  }
  
}

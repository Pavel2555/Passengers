//
//  TripTimeEnum.swift
//  Passengers
//
//  Created by Павел Бескоровайный on 16.12.2021.
//

import Foundation

enum TripTime: Int, CaseIterable {
  case t7 = 7
  case t10 = 10
  case t14 = 14
  case t17 = 17
  
  var string: String {
    switch self {
    case .t7: return "7:00"
    case .t10: return "10:00"
    case .t14: return "14:00"
    case .t17: return "17:00"
    }
  }
  
}

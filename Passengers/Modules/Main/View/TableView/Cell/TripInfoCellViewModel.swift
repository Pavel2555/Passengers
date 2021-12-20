//
//  TripInfoCellViewModel.swift
//  Passengers
//
//  Created by Павел Бескоровайный on 14.12.2021.
//

import Foundation

protocol MainTripInfoCellViewModelInputProtocol {
  var passenger: Passenger { get }
  var index: Int { get }
  var trip: Trip { get }
}

typealias MainTripInfoCellViewModelType = AdaptedCellViewModelProtocol & MainTripInfoCellViewModelInputProtocol

class MainTripInfoCellViewModel: MainTripInfoCellViewModelType {
  var passenger: Passenger
  var index: Int
  var trip: Trip
  
  init(passenger: Passenger, index: Int, trip: Trip) {
    self.passenger = passenger
    self.index = index
    self.trip = trip
  }
}


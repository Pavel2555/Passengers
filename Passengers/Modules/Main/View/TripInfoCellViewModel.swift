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
}

typealias MainTripInfoCellViewModelType = AdaptedCellViewModelProtocol & MainTripInfoCellViewModelInputProtocol

class MainTripInfoCellViewModel: MainTripInfoCellViewModelType {
  var passenger: Passenger
  var index: Int
  
  init(passenger: Passenger, index: Int) {
    self.passenger = passenger
    self.index = index
  }
}


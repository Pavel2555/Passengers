//
//  MainTripInfoViewModel.swift
//  Passengers
//
//  Created by Павел Бескоровайный on 14.12.2021.
//

import Foundation

final class TripInfoViewModel: AdaptedViewModelInputProtocol {
  var sections: [AdaptedSectionViewModelProtocol] = []
  var trip: Trip

  init(trip: Trip) {
    self.trip = trip
    
    self.setupMainSection()
  }
  
  // MARK: - Private methods

  private func setupMainSection() {
    var cells = [MainTripInfoCellViewModel]()
    trip.passengers.enumerated().forEach({ index,passenger in
      cells.append(MainTripInfoCellViewModel(passenger: passenger, index: index))
    })
    let section = AdaptedSectionViewModel(cells: cells)
    sections.append(section)
  }

}

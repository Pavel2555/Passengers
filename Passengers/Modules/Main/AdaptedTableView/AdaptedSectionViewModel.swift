//
//  AdaptedSectionViewModel.swift
//  Passengers
//
//  Created by Павел Бескоровайный on 14.12.2021.
//

import Foundation

class AdaptedSectionViewModel: AdaptedSectionViewModelProtocol {
  
  var cells: [AdaptedCellViewModelProtocol]

  init(cells: [AdaptedCellViewModelProtocol]) {
    self.cells = cells
  }
  
}

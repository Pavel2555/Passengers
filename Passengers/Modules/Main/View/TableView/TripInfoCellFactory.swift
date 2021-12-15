//
//  TripInfoCellFactory.swift
//  Passengers
//
//  Created by Павел Бескоровайный on 14.12.2021.
//

import Foundation
import UIKit

struct TripInfoCellFactory: AdaptedCellFactoryProtocol {
  
  var cellTypes: [AdaptedCellProtocol.Type] = [
    PassengerTripInfoTableViewCell.self
  ]
  
  func generateCell(viewModel: AdaptedCellViewModelProtocol, tableView: UITableView, for indexPath: IndexPath) -> UITableViewCell {
    switch viewModel {
    case let viewModel as MainTripInfoCellViewModelInputProtocol:
      let view = PassengerTripInfoTableViewCell.reuse(tableView, for: indexPath)
      view.viewModel = viewModel
      return view
    default:
      return UITableViewCell()
    }
  }
  
}

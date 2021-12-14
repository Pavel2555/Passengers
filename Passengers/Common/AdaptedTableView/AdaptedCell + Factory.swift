//
//  MainCellFactory.swift
//  Passengers
//
//  Created by Павел Бескоровайный on 14.12.2021.
//

import Foundation
import UIKit

protocol AdaptedCellViewModelProtocol { }

protocol AdaptedSectionViewModelProtocol {
  var cells: [AdaptedCellViewModelProtocol] { get }
}

protocol AdaptedViewModelInputProtocol {
  var sections: [AdaptedSectionViewModelProtocol] { get }
}

protocol AdaptedCellFactoryProtocol {
  var cellTypes: [AdaptedCellProtocol.Type] { get }
  func generateCell(viewModel: AdaptedCellViewModelProtocol, tableView: UITableView, for indexPath: IndexPath) -> UITableViewCell
}


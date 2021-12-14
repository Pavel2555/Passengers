//
//  TripInfoTableViewController.swift
//  Passengers
//
//  Created by Павел Бескоровайный on 14.12.2021.
//

import UIKit

class TripInfoTableViewController: UIViewController {
  var viewModel: TripInfoViewModel? {
    didSet {
      tableView.reloadData()
    }
  }
  
  private var tableView: AdaptedTableView! {
    didSet {
      tableView.viewModel = self.viewModel
      tableView.cellFactory = TripInfoCellFactory()
      tableView.setup()
    }
  }
  
//MARK: - initialize
  init() {
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  convenience init(viewModel: TripInfoViewModel ) {
    self.init()
    self.viewModel = viewModel
  }
  
  //MARK: - lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
  }
}

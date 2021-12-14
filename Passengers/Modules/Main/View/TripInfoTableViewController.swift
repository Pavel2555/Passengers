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
  
  var tableView: AdaptedTableView
  
//MARK: - initialize
  init() {
    tableView = AdaptedTableView()
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  convenience init(viewModel: TripInfoViewModel ) {
    self.init()
    tableView.viewModel = viewModel
    tableView.cellFactory = TripInfoCellFactory()
    tableView.setup()
    tableView.fillToSuperview()
    self.viewModel = viewModel
  }
  
  //MARK: - lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()

  }
  
  override func viewDidAppear(_ animated: Bool) {
    view.addSubview(tableView)
  }
}

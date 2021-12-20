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
      tableView.viewModel = viewModel
      tableView.reloadData()
    }
  }
  
  var tableView = AdaptedTableView()
  
//MARK: - initialize
  init(viewModel: TripInfoViewModel) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK: - lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    tableView.viewModel = self.viewModel
    tableView.cellFactory = TripInfoCellFactory()
    tableView.setup()
    tableView.anchorCenterSuperview()
    
    view.addSubview(tableView)
  }
}

extension TripInfoTableViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 80
  }
}

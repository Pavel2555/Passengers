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
    tableView.delegate = self
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
    tableView.viewModel = viewModel
    tableView.cellFactory = TripInfoCellFactory()
    tableView.setup()
    tableView.anchorCenterSuperview()
    
    tableView.frame = self.view.frame
    view.addSubview(tableView)
  }
}

extension TripInfoTableViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 80
  }
}

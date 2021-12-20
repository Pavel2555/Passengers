//
//  PassengerViewController.swift
//  Passengers
//
//  Created by Павел Бескоровайный on 19.12.2021.
//

import UIKit


class PassengerViewController: UIViewController, StoryboardInitializable {
  @IBOutlet weak var tableView: UITableView!
  
  var dataSource: [Passenger] = []
  var delegate: PassengerWasChosen?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.dataSource = RealmService.shared.allPassengers
    
    tableView.delegate = self
    tableView.dataSource = self
  }
  
  @IBAction func closeAction(_ sender: Any) {
    self.dismiss(animated: true)
  }
  
}

extension PassengerViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dataSource.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "Passenger") as? PassengerTableViewCell else {
      return UITableViewCell()
    }
    cell.setUI(with: dataSource[indexPath.row])
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 60
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if let delegate = delegate {
      delegate.didSelect(pass: dataSource[indexPath.row])
      self.dismiss(animated: true)
    }
    
  }
  
  
}

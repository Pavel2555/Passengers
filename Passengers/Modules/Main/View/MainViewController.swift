//
//  ViewController.swift
//  Passengers
//
//  Created by Павел Бескоровайный on 10.12.2021.
//

import UIKit
import RealmSwift


class MainViewController: UIViewController {
  @IBOutlet weak var dataContainer: UIView!
  @IBOutlet weak var calendarButton: UIButton!
  @IBOutlet var timeButtons: [UIButton]!

  private var tableViewModel: TripInfoViewModel?
  
  private var datePicker = UIDatePicker()
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func showCalendar(_ sender: Any) {
  }
  
  @IBAction func showContacts(_ sender: Any) {
  }
  
  @IBAction func showSettings(_ sender: Any) {
  }
  
  @IBAction func addPassenger(_ sender: Any) {
    let vc = PassengerInfoViewController.createFromStoryboard()
    self.present(vc, animated: true)
  }
  
  @IBAction func changeTime(_ sender: Any) {
  }
  
  
  private func addChild(with viewModel: TripInfoViewModel) {
    let vc = TripInfoTableViewController(viewModel: viewModel)
    addChild(vc)
    vc.view.translatesAutoresizingMaskIntoConstraints = false
    vc.view.frame = self.dataContainer.bounds
    dataContainer.addSubview(vc.view)
    
    self.tableViewModel = vc.viewModel
    vc.didMove(toParent: self)
  }
  
  private func setupCalendar() {
//    tableViewModel?.trip.tripDate
  }
}


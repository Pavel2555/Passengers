//
//  ViewController.swift
//  Passengers
//
//  Created by Павел Бескоровайный on 10.12.2021.
//

import UIKit
import Foundation
import RealmSwift


class MainViewController: UIViewController {
  @IBOutlet weak var dataContainer: UIView!
  @IBOutlet weak var datePicker: UIDatePicker!
  @IBOutlet var timeButtons: [UIButton]!

  private var tableViewModel: TripInfoViewModel?
  private var childTableVC: TripInfoTableViewController?
  
  private var dataBaseObserver: NSObjectProtocol!
  
  private var chosenDate = Date() {
    didSet {
      reloadTripData()
    }
  }
  private var chosenTime: TripTime = .t7 {
    didSet {
      reloadTripData()
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    dataBaseObserver = Notification.Name.dataBaseWasChanged.onPost { [weak self] _ in
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
        self?.reloadTripData()
      }
    }
    
    self.datePicker.addTarget(self, action: #selector(dateWasChanged), for: .valueChanged)
    let trip = Trip()
    trip.timeStamp = chosenDate.milisecondsSince1970
    setActiveButton(with: chosenTime)
    self.addChild(with: TripInfoViewModel(trip: trip))
    self.title = chosenDate.toString()
  }
  
  deinit {
    NotificationCenter.default.removeObserver(dataBaseObserver as Any)
  }
  
  
  @IBAction func showContacts(_ sender: Any) {
    let vc = PassengerViewController.createFromStoryboard()
    self.present(vc, animated: true)
  }
  
  @IBAction func showSettings(_ sender: Any) {
  }
  
  @IBAction func addPassenger(_ sender: Any) {
    let vc = PassengerInfoViewController.createFromStoryboard()
    vc.chosenDate = self.chosenDate
    vc.chosenTime = self.chosenTime
    
    self.present(vc, animated: true)
  }
  
  @IBAction func changeTime(_ sender: UIButton) {
    chosenTime = TripTime(rawValue: sender.tag) ?? .t7
    setActiveButton(with: chosenTime)
    reloadTripData()
    
  }
  
  private func reloadTripData() {
    let timeStamp = self.chosenDate.setTime(hour: chosenTime.rawValue).milisecondsSince1970
    childTableVC?.viewModel = TripInfoViewModel(trip: RealmService.shared.findOrCreateTrip(timeStamp: timeStamp))
  }
  
  
  private func addChild(with viewModel: TripInfoViewModel) {
    let vc = TripInfoTableViewController(viewModel: viewModel)
    addChild(vc)
    vc.view.translatesAutoresizingMaskIntoConstraints = false
    vc.view.frame = self.dataContainer.bounds
    vc.tableView.frame = self.dataContainer.bounds
    dataContainer.addSubview(vc.view)
    
    self.childTableVC = vc
    vc.didMove(toParent: self)
  }
  
  @objc private func dateWasChanged() {
    self.chosenDate = datePicker.date.setTime(hour: chosenTime.rawValue)
    self.title = chosenDate.toString()
  }
  
  private func setActiveButton(with time: TripTime) {
    timeButtons.forEach({
      $0.tintColor =  $0.tag == time.rawValue ? UIColor(named: "main_button") : .white
      $0.backgroundColor = $0.tag == time.rawValue ? .white : UIColor(named: "main_button")
    })
  }

}


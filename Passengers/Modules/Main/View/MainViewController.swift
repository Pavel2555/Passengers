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

  private var childTableView: TripInfoTableViewController?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let trip = Trip()
    trip.tripDate = 5
    let passenger = Passenger()
    passenger.name = "Вася"
    passenger.phone = "123"
//    let passenger2 = Passenger()
//    passenger2.name = "Антон"
//    passenger2.phone = "456"
    
    let realm = try! Realm()
    
    try? realm.write {
      if let existingPassenger = realm.objects(Passenger.self).filter({$0.phone == passenger.phone}).first {
        existingPassenger.name = "Вася"
      } else {
        realm.add(passenger)
        if let existingTrip =  realm.objects(Trip.self).toArray().filter({$0.tripDate == trip.tripDate}).first {
          existingTrip.passengers.append(passenger)
        } else {
          trip.passengers.append(passenger)
          realm.add(trip)
        }
      }
    }
    
    self.addChild(with: TripInfoViewModel(trip: realm.objects(Trip.self).toArray().first!))
  }
  
  
  @IBAction func showCalendar(_ sender: Any) {
    
  }
  
  @IBAction func changeTime(_ sender: Any) {
  }
  
  
  private func addChild(with viewModel: TripInfoViewModel) {
    let vc = TripInfoTableViewController(viewModel: viewModel)
    addChild(vc)
    vc.view.translatesAutoresizingMaskIntoConstraints = false
    vc.view.frame = self.dataContainer.bounds
    dataContainer.addSubview(vc.view)
    
    self.childTableView = vc
    vc.didMove(toParent: self)
    childTableView?.tableView.reloadData()
  }
  
}

//@IBAction func addPassengerAction(_ sender: Any) {
//  if let phone = phoneTextField.text, !phone.isEmpty,
//     let name = nameTextField.text , !name.isEmpty {
//
//    let passenger = Passenger()
//    passenger.name = name
//    passenger.phone = phone
//
//    let trip = Trip()
//    trip.tripDate = self.tripDate
//
//    let realm = try! Realm()
////
//    try? realm.write {
//      if let passenger = realm.objects(Passenger.self).filter({$0.phone == passenger.phone}).first {
//        passenger.name = name
//      } else {
//        realm.add(passenger)
//        if let existingTrip =  realm.objects(Trip.self).toArray().filter({$0.tripDate == trip.tripDate}).first {
//          existingTrip.passengers.append(passenger)
//        } else {
//          trip.passengers.append(passenger)
//          realm.add(trip)
//        }
//      }
//    }
//  }
//}
//}


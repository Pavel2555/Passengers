//
//  PassengerTripInfoTableViewCell.swift
//  Passengers
//
//  Created by Павел Бескоровайный on 13.12.2021.
//

import UIKit

class PassengerTripInfoTableViewCell: UITableViewCell, AdaptedCellProtocol {
  @IBOutlet weak var passengerTripIndexLabel: UILabel!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var phoneLabel: UILabel!
  
  
  var viewModel: MainTripInfoCellViewModelInputProtocol? {
    didSet {
      bindViewModelToUI()
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    let gesture = UILongPressGestureRecognizer(target: self, action: #selector(deleteGestureProcess(_:)))
    gesture.minimumPressDuration = 1
    contentView.addGestureRecognizer(gesture)
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
  @IBAction func makeCall(_ sender: Any) {
    if let number = phoneLabel.text {
      self.callNumber(phoneNumber: number)
    }
  }
  
  private func bindViewModelToUI() {
    if let index = viewModel?.index, let passenger = viewModel?.passenger {
      self.passengerTripIndexLabel.text = (index + 1).toString()
      self.nameLabel.text = passenger.name
      self.phoneLabel.text = passenger.phone
    }
  }
  
  private func callNumber(phoneNumber: String) {
      guard let url = URL(string: "telprompt://\(phoneNumber)"),
          UIApplication.shared.canOpenURL(url) else {
          return
      }
      UIApplication.shared.open(url, options: [:], completionHandler: nil)
  }
  
  @objc private func deleteGestureProcess(_ sender: UILongPressGestureRecognizer) {
    if let viewModel = viewModel {
    if sender.state == .began {
      let confirmAction = UIAlertAction(title: "Подтвердить", style: .destructive) { _ in
        RealmService.shared.deletePassengerFromTrip(viewModel.passenger, from: viewModel.trip)
      }
      let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
      UIAlertController.alert(with: "Вы действительно хотите удалить пассажира из поездки?",
                              message: "",
                              actions: [confirmAction, cancelAction])
    }
    }
  }
  }
  

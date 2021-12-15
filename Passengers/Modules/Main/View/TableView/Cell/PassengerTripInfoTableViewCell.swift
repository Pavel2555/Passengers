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
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
  private func bindViewModelToUI() {
    if let index = viewModel?.index, let passenger = viewModel?.passenger {
      self.passengerTripIndexLabel.text = index.toString()
      self.nameLabel.text = passenger.name
      self.phoneLabel.text = passenger.phone
    }
  }
  
}

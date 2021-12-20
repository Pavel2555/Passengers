//
//  PassengerTableViewCell.swift
//  Passengers
//
//  Created by Павел Бескоровайный on 19.12.2021.
//

import UIKit

class PassengerTableViewCell: UITableViewCell {
  @IBOutlet weak var numberOfTrips: UILabel!
  @IBOutlet weak var name: UILabel!
  @IBOutlet weak var phone: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

  public func setUI(with pass: Passenger) {
    self.name.text = pass.name
    self.phone.text = pass.phone
    self.numberOfTrips.text = "поездки:  \(RealmService.shared.getCountOfTripsForPassenger(pass).toString())"
  }

}

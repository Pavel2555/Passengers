//
//  PassengerInfoViewController.swift
//  Passengers
//
//  Created by Павел Бескоровайный on 15.12.2021.
//

import UIKit

class PassengerInfoViewController: UIViewController, StoryboardInitializable {
  @IBOutlet weak var tripLabel: UILabel!
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var timeLabel: UILabel!
  @IBOutlet weak var passengerLabel: UILabel!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var telephoneLabel: UILabel!
  
  @IBOutlet weak var dateTextField: UITextField!
  @IBOutlet weak var timeTextField: UITextField!
  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var telephoneTextField: UITextField!
  @IBOutlet weak var addPassengerButton: UIButton!
  
    override func viewDidLoad() {
        super.viewDidLoad()
      setFields()
    }
  
  private func setFields() {
    [dateTextField,
     timeTextField,
     nameTextField,
     telephoneTextField].forEach({
      $0?.delegate = self
      $0?.borderWidth = 1
      $0?.cornerRadius = 8
      $0?.borderColor = UIColor(named: "main_placeholder") ?? .systemGray
    })
  }

}

extension PassengerInfoViewController: UITextFieldDelegate {
  
}

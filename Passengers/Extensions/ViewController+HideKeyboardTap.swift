//
//  ViewController+HideKeyboardTap.swift
//  Passengers
//
//  Created by Павел Бескоровайный on 16.12.2021.
//

import Foundation
import UIKit

extension UIViewController {
  func hideKeyboardWhenTappedAround(cancelsTouchesInView: Bool = false) {
    let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboardByTap(_:)))
    tap.cancelsTouchesInView = cancelsTouchesInView
    view.addGestureRecognizer(tap)
  }
  
  @objc private func dismissKeyboardByTap(_ sender: UITapGestureRecognizer) {
    view.endEditing(true)
  }
}

//
//  UIAlertViewController+Extensions.swift
//  TrackEnsure Driver
//
//  Created by Павел Бескоровайный on 11.03.2021.
//

import Foundation
import UIKit

extension UIAlertController {
  static func alert(with title: String = "Ошибка", message: String, actions: [UIAlertAction]? = nil) {
    guard let topViewController = UIApplication.topViewController() else {
      return
    }
    let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
    if let _actions = actions, !_actions.isEmpty {
      _actions.forEach { alert.addAction($0) }
    } else {
      alert.addAction(UIAlertAction.init(title: "Ok", style: .default))
    }

    topViewController.present(alert, animated: true)
  }
}

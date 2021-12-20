//
//  StoryboardInitializable.swift
//  TrackEnsure ELD Native
//
//  Created by Vitaliy on 8/20/19.
//  Copyright © 2019 Vitaliy. All rights reserved.
//

import UIKit

protocol StoryboardInitializable {
  static var storyboardName: String { get }
  static var storyboardBundle: Bundle? { get }
  
  static func createFromStoryboard() -> Self
}

extension StoryboardInitializable where Self : UIViewController {
  
  static var storyboardName: String {
    return "Main"
  }
  
  static var storyboardBundle: Bundle? {
    return nil
  }
  
  static var storyboardIdentifier: String {
    return String(describing: self)
  }
  
  static func createFromStoryboard() -> Self {
    let storyboard = UIStoryboard(name: storyboardName, bundle: storyboardBundle)
    return storyboard.instantiateViewController(withIdentifier: storyboardIdentifier) as! Self
  }
  
}

extension StoryboardInitializable where Self : PassengerInfoViewController {
  static var storyboardName: String {
    return "PassengerInfo"
  }
}

extension StoryboardInitializable where Self : PassengerViewController {
  static var storyboardName: String {
    return "Passenger"
  }
}

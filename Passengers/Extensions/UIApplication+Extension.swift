//
//  UIApplication+Extension.swift
//  TrackEnsure Driver
//
//  Created by Vitalij Semenenko on 2021-02-11.
//

import UIKit

extension UIApplication {
  var appDelegate: UIApplicationDelegate {
    return UIApplication.shared.delegate as! AppDelegate
  }
  
  var appWindow: UIWindow? {
    if let window = appDelegate.window {
      return window!
    }
    return nil
  }
  
  var rootViewController: UIViewController? {
    return appDelegate.window??.rootViewController
  }
  
  // special extension for call from seperate class present UIController
  // you can use it : UIApplication.topViewController()?.present(..)
  class func topViewController(base: UIViewController? = UIApplication.shared.windows.first{$0.isKeyWindow}?.rootViewController) -> UIViewController? {
    if let nav = base as? UINavigationController {
      return topViewController(base: nav.visibleViewController)
    }
    if let tab = base as? UITabBarController {
      if let selected = tab.selectedViewController {
        return topViewController(base: selected)
      }
    }
    if let presented = base?.presentedViewController {
      return topViewController(base: presented)
    }
    return base
  }
  
}

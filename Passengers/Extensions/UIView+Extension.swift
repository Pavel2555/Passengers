//
//  UIView+Extension.swift
//  Passengers
//
//  Created by Павел Бескоровайный on 10.12.2021.
//
import Foundation
import UIKit

public extension UIView {
  
  /// SwifterSwift: Border color of view; also inspectable from Storyboard.
  @IBInspectable var borderColor: UIColor? {
    get {
      guard let color = layer.borderColor else { return nil }
      return UIColor(cgColor: color)
    }
    set {
      guard let color = newValue else {
        layer.borderColor = nil
        return
      }
      // Fix React-Native conflict issue
      guard String(describing: type(of: color)) != "__NSCFType" else { return }
      layer.borderColor = color.cgColor
    }
  }
  
  /// SwifterSwift: Border width of view; also inspectable from Storyboard.
  @IBInspectable var borderWidth: CGFloat {
    get {
      return layer.borderWidth
    }
    set {
      layer.borderWidth = newValue
    }
  }
  
  /// SwifterSwift: Corner radius of view; also inspectable from Storyboard.
  @IBInspectable var cornerRadius: CGFloat {
    get {
      return layer.cornerRadius
    }
    set {
      layer.masksToBounds = true
      layer.cornerRadius = abs(CGFloat(Int(newValue * 100)) / 100)
    }
  }
  /// SwifterSwift: Add Visual Format constraints.
  ///
  /// - Parameters:
  ///   - withFormat: visual Format language
  ///   - views: array of views which will be accessed starting with index 0 (example: [v0], [v1], [v2]..)
  @available(iOS 9, *) func addConstraints(withFormat: String, views: UIView...) {
    // https://videos.letsbuildthatapp.com/
    var viewsDictionary: [String: UIView] = [:]
    for (index, view) in views.enumerated() {
      let key = "v\(index)"
      view.translatesAutoresizingMaskIntoConstraints = false
      viewsDictionary[key] = view
    }
    addConstraints(NSLayoutConstraint.constraints(withVisualFormat: withFormat, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
  }
  

  @available(iOS 9, *) func fillToSuperview() {
    translatesAutoresizingMaskIntoConstraints = false
    if let superview = superview {
      let left = leftAnchor.constraint(equalTo: superview.leftAnchor)
      let right = rightAnchor.constraint(equalTo: superview.rightAnchor)
      let top = topAnchor.constraint(equalTo: superview.topAnchor)
      let bottom = bottomAnchor.constraint(equalTo: superview.bottomAnchor)
      NSLayoutConstraint.activate([left, right, top, bottom])
    }
  }
  
  /// SwifterSwift: Add anchors from any side of the current view into the specified anchors and returns the newly added constraints.
  ///
  /// - Parameters:
  ///   - top: current view's top anchor will be anchored into the specified anchor
  ///   - left: current view's left anchor will be anchored into the specified anchor
  ///   - bottom: current view's bottom anchor will be anchored into the specified anchor
  ///   - right: current view's right anchor will be anchored into the specified anchor
  ///   - topConstant: current view's top anchor margin
  ///   - leftConstant: current view's left anchor margin
  ///   - bottomConstant: current view's bottom anchor margin
  ///   - rightConstant: current view's right anchor margin
  ///   - widthConstant: current view's width
  ///   - heightConstant: current view's height
  /// - Returns: array of newly added constraints (if applicable).
  @available(iOS 9, *) @discardableResult func anchor(
    top: NSLayoutYAxisAnchor? = nil,
    left: NSLayoutXAxisAnchor? = nil,
    bottom: NSLayoutYAxisAnchor? = nil,
    right: NSLayoutXAxisAnchor? = nil,
    topConstant: CGFloat = 0,
    leftConstant: CGFloat = 0,
    bottomConstant: CGFloat = 0,
    rightConstant: CGFloat = 0,
    widthConstant: CGFloat = 0,
    heightConstant: CGFloat = 0) -> [NSLayoutConstraint] {
      // https://videos.letsbuildthatapp.com/
      translatesAutoresizingMaskIntoConstraints = false
      
      var anchors = [NSLayoutConstraint]()
      
      if let top = top {
        anchors.append(topAnchor.constraint(equalTo: top, constant: topConstant))
      }
      
      if let left = left {
        anchors.append(leftAnchor.constraint(equalTo: left, constant: leftConstant))
      }
      
      if let bottom = bottom {
        anchors.append(bottomAnchor.constraint(equalTo: bottom, constant: -bottomConstant))
      }
      
      if let right = right {
        anchors.append(rightAnchor.constraint(equalTo: right, constant: -rightConstant))
      }
      
      if widthConstant > 0 {
        anchors.append(widthAnchor.constraint(equalToConstant: widthConstant))
      }
      
      if heightConstant > 0 {
        anchors.append(heightAnchor.constraint(equalToConstant: heightConstant))
      }
      
      anchors.forEach({$0.isActive = true})
      
      return anchors
    }
  
  /// SwifterSwift: Anchor center X into current view's superview with a constant margin value.
  ///
  /// - Parameter constant: constant of the anchor constraint (default is 0).
  @available(iOS 9, *) func anchorCenterXToSuperview(constant: CGFloat = 0) {
    // https://videos.letsbuildthatapp.com/
    translatesAutoresizingMaskIntoConstraints = false
    if let anchor = superview?.centerXAnchor {
      centerXAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
    }
  }
  
  /// SwifterSwift: Anchor center Y into current view's superview with a constant margin value.
  ///
  /// - Parameter withConstant: constant of the anchor constraint (default is 0).
  @available(iOS 9, *) func anchorCenterYToSuperview(constant: CGFloat = 0) {
    // https://videos.letsbuildthatapp.com/
    translatesAutoresizingMaskIntoConstraints = false
    if let anchor = superview?.centerYAnchor {
      centerYAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
    }
  }
  
  /// SwifterSwift: Anchor center X and Y into current view's superview
  @available(iOS 9, *) func anchorCenterSuperview() {
    // https://videos.letsbuildthatapp.com/
    anchorCenterXToSuperview()
    anchorCenterYToSuperview()
  }
}

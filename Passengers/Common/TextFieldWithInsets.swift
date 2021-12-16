//
//  TextFieldWithInsets.swift
//  Passengers
//
//  Created by Павел Бескоровайный on 16.12.2021.
//

import Foundation
import UIKit

class TextFieldWithInsets: UITextField {
  var textPadding: UIEdgeInsets?
  
  @IBInspectable var horizontalInset: CGFloat = 12
  @IBInspectable var verticalInset: CGFloat = 0
  
  override func textRect(forBounds bounds: CGRect) -> CGRect {
    let rect = bounds.insetBy(dx: horizontalInset, dy: verticalInset)
    guard let textPadding = self.textPadding else { return rect }
    return rect.inset(by: textPadding)
  }
  
  override func editingRect(forBounds bounds: CGRect) -> CGRect {
    let rect = bounds.insetBy(dx: horizontalInset, dy: verticalInset)
    guard let textPadding = self.textPadding else { return rect }
    return rect.inset(by: textPadding)
  }
  
  override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
    let rect = bounds.insetBy(dx: horizontalInset, dy: verticalInset)
    guard let textPadding = self.textPadding else { return rect }
    return rect.inset(by: textPadding)
  }
}

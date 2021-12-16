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
  
  @IBOutlet weak var datePicker: UIDatePicker!
  @IBOutlet weak var timeTextField: TextFieldWithInsets!
  @IBOutlet weak var nameTextField: TextFieldWithInsets!
  @IBOutlet weak var telephoneTextField: TextFieldWithInsets!
  @IBOutlet weak var addPassengerButton: UIButton!
  
  @IBOutlet weak var mainStack: UIStackView!
  @IBOutlet weak var bottomAnchor: NSLayoutConstraint!
  
  
  var timePicker: UIPickerView {
    let picker = UIPickerView()
    picker.dataSource = self
    picker.delegate = self
    return picker
  }
  
  fileprivate var toolBar: UIToolbar {
    let toolbar = UIToolbar()
    toolbar.sizeToFit()
    let cancelButton = UIBarButtonItem(title: "Отмена", style: .done, target: self, action: #selector(ignoreChangesCancelButton))
    let saveButton = UIBarButtonItem(title: "Сохранить", style: .done, target: self, action: #selector(saveChosenData))
    let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    toolbar.setItems([cancelButton, space, saveButton], animated: false)
    return toolbar
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setMainBottomAnchor()
    setupInputFields()
  }
  
  deinit {
    NotificationCenter.default.removeObserver(self)
  }
  
  private func setupInputFields() {
    hideKeyboardWhenTappedAround()
    [timeTextField,
     nameTextField,
     telephoneTextField].forEach({
      $0?.delegate = self
      $0?.borderWidth = 1
      $0?.cornerRadius = 8
      $0?.borderColor = UIColor(named: "main_placeholder") ?? .systemGray
      $0?.inputAccessoryView = self.toolBar
    })
    timeTextField.inputView = self.timePicker
    timeTextField.inputAccessoryView = self.toolBar
    nameTextField.keyboardType = .namePhonePad
    telephoneTextField.keyboardType = .phonePad
    
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    
  }
  
  @objc private func ignoreChangesCancelButton() {
    view.endEditing(false)
  }

  @objc private func saveChosenData() {
    view.endEditing(false)
  }
  
  @objc private func keyboardWillShow(notification: NSNotification) {
    if let keyboardHeight = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height {
      self.bottomAnchor.constant = keyboardHeight + 10
  }
  }
  
  @objc private func keyboardWillHide(notification: NSNotification) {
    setMainBottomAnchor()
  }
  
  private func setMainBottomAnchor() {
    self.bottomAnchor.constant = (self.view.bounds.height - self.mainStack.bounds.height) / 2
  }
  
}

extension PassengerInfoViewController: UITextFieldDelegate {
  
}

extension PassengerInfoViewController: UIPickerViewDelegate, UIPickerViewDataSource {
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return TripTime.allCases.count
  }
  
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return TripTime.allCases[row].string
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    self.timeTextField.text = TripTime.allCases[row].string
  }
  
}

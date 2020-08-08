//
//  PointSelectPeriodView.swift
//  Sample1128
//
//  Created by t shimada on 2020/07/27.
//  Copyright © 2020 TAKESHI SHIMADA. All rights reserved.
//

import Foundation
import SwiftDate
import UIKit
import RxCocoa
import RxSwift

class PointSelectPeriodView: UIView, NibLoaderProtocol  {

    @IBOutlet private weak var periodView: UIView!
    @IBOutlet private weak var showButton: UIButton!
    @IBOutlet private weak var textField: UITextField!
    private var yearMonthString: String?
    var showAction: ((String) -> Void)?

    let disposeBag = DisposeBag()
    
    let pickerView = UIPickerView()

    let years = (2000...(Date() + 1.day).year).map { $0 }
    let months = (1...12).map { String(format: "%02d", $0) }
    
    private let datePicker = UIDatePicker()

    override init(frame: CGRect) {
        super.init(frame: frame)
        _loadNib()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        _loadNib()
    }

    func _loadNib() {
        addNibWithLayout()
        setupUI()
    }

    func setupUI() {
        periodView.corner(radius: 8.0)
        periodView.border(width: 1.0, color: .lightGray)
        showButton.corner(radius: 6.0)
        setPicker()
        showButton.isEnabled = false
    }

    func setPicker() {
        
        textField.borderStyle = .none
        pickerView.backgroundColor = .white
        pickerView.delegate = self
        textField.inputView = pickerView

        // ツールバー
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "完了", style: .plain, target: self, action: #selector(donedatePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.setItems([spaceButton, spaceButton, doneButton], animated: false)
        textField.inputAccessoryView = toolbar

        if let index = years.firstIndex(where: { $0 == Date().year }) {
            pickerView.selectRow(index, inComponent: 0, animated: false)
        }
        if let index = months.firstIndex(where: { $0 == String(format: "%02d", Date().month) }) {
            pickerView.selectRow(index, inComponent: 1, animated: false)
        }

    }

    @objc func donedatePicker() {
        update(pickerView: pickerView)
        endEditing(true)
    }
    @IBAction func showButtonDidTapped(sender: UIButton) {
        if let str = textField.text, let showAction = showAction {
            showAction(str)
        }
        endEditing(true)
    }
    
}

extension PointSelectPeriodView: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return years.count
        } else if component == 1 {
            return months.count
        } else {
            return 0
        }
    }

    // MARK: - UIPickerView delegate

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return "\(years[row])"
        } else if component == 1 {
            return "\(months[row])"
        } else {
            return nil
        }
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        update(pickerView: pickerView)
    }
    
    private func update(pickerView: UIPickerView) {
        let year = years[pickerView.selectedRow(inComponent: 0)]
        let month = months[pickerView.selectedRow(inComponent: 1)]
        yearMonthString = "\(year)\(month)"
        textField.text = yearMonthString
        showButton.isEnabled = true
    }
    
}


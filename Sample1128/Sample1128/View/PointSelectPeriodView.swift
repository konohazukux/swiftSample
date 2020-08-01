//
//  PointSelectPeriodView.swift
//  Sample1128
//
//  Created by t shimada on 2020/07/27.
//  Copyright © 2020 TAKESHI SHIMADA. All rights reserved.
//

import Foundation
import UIKit

class PointSelectPeriodView: UIView, NibLoaderProtocol  {

    @IBOutlet private weak var periodView: UIView!
    @IBOutlet private weak var doneButton: UIView!
    @IBOutlet private weak var birthdayTf: UITextField!

    
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
        doneButton.corner(radius: 6.0)
       showDatePicker()
    }

    @IBAction func showPickerDidTapped(sender: UIButton) {
    }
    
    func showDatePicker() {
        // 日付のフォーマット
        var calendar = Calendar(identifier: .gregorian)
        calendar.locale = Calendar.current.locale
        datePicker.calendar = calendar
        datePicker.locale = Locale(identifier: "ja")
        datePicker.timeZone = TimeZone(secondsFromGMT: 9 * 60 * 60)
        datePicker.datePickerMode = .date
        datePicker.minimumDate = Date(timeIntervalSince1970: 0)
        datePicker.maximumDate = Date()
        if let birthDay = birthdayTf.text, let birthDayDate = Date.convertToDate(birthDay, format: .yyyyMMddSlash) {
            datePicker.date = birthDayDate
        } else {
            datePicker.date = Date(timeIntervalSince1970: 0)
        }
        // ツールバー
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "完了", style: .plain, target: self, action: #selector(donedatePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)

        toolbar.setItems([spaceButton, spaceButton, doneButton], animated: false)

        birthdayTf.inputAccessoryView = toolbar
        birthdayTf.inputView = datePicker
    }
    
    @objc func donedatePicker() {
        
    }

    
}

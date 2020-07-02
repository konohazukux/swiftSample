//
//  FirstViewController.swift
//  Sample1128
//
//  Created by TAKESHI SHIMADA on 2019/11/28.
//  Copyright © 2019 TAKESHI SHIMADA. All rights reserved.
//

import UIKit
import SafariServices
import RxSwift
import RxCocoa
import SwiftDate

class FirstViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var phoneTf: UITextField!
    @IBOutlet weak var oneButton: UIButton!
    private var myButton: UIButton!
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 1)
   
        oneButton.contentHorizontalAlignment = .leading
        
        oneButton.titleEdgeInsets = .init(top: 0, left: 10, bottom: 0, right: 0)
        
//        NotificationCenter.default.addObserver(
//            self,
//            selector: #selector(self.didchange),
//            name: UITextField.textDidChangeNotification,
//            object: nil
//        )

//        self.phoneTf.rx.value
//            .compactMap { val in
//                return val
//            }
//        .bind(onNext: { str in
//
//            var str1 = str.replacingOccurrences(of: " ", with: "")
//            if str1.count >= 7 {
//                let insertIdx = str.index(str1.startIndex, offsetBy: 7)
//                str1.insert(contentsOf: " ", at: insertIdx)
//            }
//
//            if str1.count >= 3 {
//                let insertIdx = str.index(str1.startIndex, offsetBy: 3)
//                str1.insert(contentsOf: " ", at: insertIdx)
//            }
//
//
//            self.phoneTf.text = str1
//            })
//            .disposed(by: disposeBag)

        
//        self.phoneTf.rx.text
//            .distinctUntilChanged()
//            .map { val in
//
//                print(" \(val) ")
//            }
//        .subscribe()
//        .disposed(by: disposeBag)
        
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @objc func didchange() {
        if let str = phoneTf.text {

            print("-----")
            var str1 = str.replacingOccurrences(of: " ", with: "")
            if str1.count >= 7 {
                let insertIdx = str.index(str1.startIndex, offsetBy: 7)
                str1.insert(contentsOf: " ", at: insertIdx)
            }
            
            if str1.count >= 3 {
                let insertIdx = str.index(str1.startIndex, offsetBy: 3)
                str1.insert(contentsOf: " ", at: insertIdx)
            }

            phoneTf.text = str1

        }
    }

}

extension Array {
  subscript (safe index: Index) -> Element? {
    return indices.contains(index) ? self[index] : nil
  }
}


private let phoneNumberLength = 11

extension FirstViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
       
        print(" \(textField.text)  \(range) \(string) ")
        
        var oldString = textField.text ?? ""

        let isDelete = range.length != 0

        let idxConvertDic: [Int: Int] = [
            0: 0,
            1: 1,
            2: 2,
            3: 2,
            4: 3,
            5: 4,
            6: 5,
            7: 6,
            8: 6,
            9: 7,
            10: 8,
            11: 9,
            12: 10
        ]

    
        
        
        
        /*
        let noKaraIdx = [0, 1, 2, nil, 3, 4, 5, 6, nil, 7, 8, 9, 10]

        let start = range.location
        let end = range.location + range.length
        let beforeIndexes = Array(start...end)
        let afterIndexes = beforeIndexes.compactMap { noKaraIdx[$0] }
//        print(" \(before)  \(after)   ")
       */

//        let aRange = Range.init
      
        if isDelete {
          
            let start = oldString.index(oldString.startIndex, offsetBy: range.location)
            let end = oldString.index(oldString.startIndex, offsetBy: range.location + range.length)
            
            print(oldString)
            oldString.removeSubrange(start..<end)
            print(oldString)

            // キャレットを調整する
            if let position = textField.position(from: textField.beginningOfDocument, offset: range.location) {
                textField.selectedTextRange = textField.textRange(from: position, to: position)
            }

            
//           let temp1 =  oldString.prefix(range.location)
//            let temp2 = oldString.suffix(<#T##maxLength: Int##Int#>)
//
//            let start = oldString.index(oldString.startIndex, offsetBy: 7)
//            let end = oldString.index(oldString.endIndex, offsetBy: -6)
//            let range = start..<end
//
//            let mySubstring = oldString[range]  // play
//
            
        }

        let isAdd = string.count > 0
        if isAdd {
            let insertIdx = oldString.index(oldString.startIndex, offsetBy: range.location)
            oldString.insert(contentsOf: string, at: insertIdx)
            
            // キャレットを調整する
            if let position = textField.position(from: textField.beginningOfDocument, offset: range.location + 1) {
                textField.selectedTextRange = textField.textRange(from: position, to: position)
            }
        }
        
        print(oldString)

//        if let str = phoneTf.text {
//
////            print("-----")
//            var str1 = str.replacingOccurrences(of: " ", with: "")
//            if str1.count >= 7 {
//                let insertIdx = str.index(str1.startIndex, offsetBy: 7)
//                str1.insert(contentsOf: " ", at: insertIdx)
//            }
//
//            if str1.count >= 3 {
//                let insertIdx = str.index(str1.startIndex, offsetBy: 3)
//                str1.insert(contentsOf: " ", at: insertIdx)
//            }
//
////            phoneTf.text = str1 + string
//
//        }
        
        textField.text = oldString

        if isDelete {
            if let position = textField.position(from: textField.beginningOfDocument, offset: range.location) {
                textField.selectedTextRange = textField.textRange(from: position, to: position)
            }

        }

        if isAdd {
            // キャレットを調整する
            if let position = textField.position(from: textField.beginningOfDocument, offset: range.location + 1) {
                textField.selectedTextRange = textField.textRange(from: position, to: position)
            }
        }

        
        return false
        
    }
    
    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        if string.isEmpty { // deleting
//            return true
//        }
//
//        let delimeter = " "
//        guard range.location < 19, string != delimeter else {
//            return false
//        }
//        switch range.location {
//        case 4, 9, 14:
//            if let text = textField.text {
//                textField.text = "\(text)\(delimeter)" // format with delimeter
//            }
//        default:
//            break
//        }
//        return true
//    }

    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//
//        guard CharacterSet(charactersIn: "0123456789").isSuperset(of: CharacterSet(charactersIn: string)) else {
//            return false
//        }
//        let currentText = textField.text
//        let isBackspace = string.isEmpty
//        let nextText = ((textField.text ?? "") as NSString).replacingCharacters(in: range, with: string)
//
//
//        // 最大桁数チェック
//        if nextText.replacingOccurrences(of: " ", with: "").count > phoneNumberLength {
//            return false
//        }
//
//        // textField自身に対する副作用
//        if (currentText?.count == 3) || (currentText?.count == 8) {
//            if !isBackspace {
//                // 半角スペースを追加する
//                textField.text = (textField.text)! + " "
//            }
//        }
//
//        if (currentText?.count == 5) || (currentText?.count == 10) {
//            if isBackspace {
//                // 半角スペースを削除する
//                phoneTf.text = (textField.text! as NSString).substring(to: (currentText?.count)! - 1)
//            }
//        }
//
//
//        //print("infolog:\(#line) \(type(of: self))  \(#function) : \(textField.text) ")
//
//        return true
//    }
    
}


extension FirstViewController {
    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        let newText = ((textField.text ?? "") as NSString).replacingCharacters(in: range, with: string)
//        let newValue = Int(newText.removeComma())
//        self.numOfHolders.current = newValue
//        textField.text = newValue?.commaString()
//        self.updateValidations()
//        return false
//    }
  
    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        let newText = ((textField.text ?? "") as NSString).replacingCharacters(in: range, with: string)
//        if newText.isEmpty {
//            return true
//        } else if newText.isNumeric() {
//            guard isValid(newText) else {
//                state = .input
//                return newText.count < 6
//            }
//            close(newText)
//            return false
//        } else {
//            return false
//        }
//    }
    
    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        if textField == self.editQuantityTextField {
//            // 入力に応じてquantityを変更する。
//            let text: String = "\((textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? string)"
//            // 1桁目の変更を許容するため，""を許容する(UIKeyboardを閉じる際に""の置換判定を行う)。
//            if text == "" {
//                return true
//            }
//            if let willQuantity = Int(text) {
//                self.quantity = willQuantity
//                // UITextFieldの内容の変更は`updateEditDisplay`側で行い，
//                error = nil
//                self.updateEditDisplay(false)
//                // Delegateからの変更は禁止(false)する。
//                return false
//            }
//        }
//        return true
//    }
  
    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        guard !string.isEmpty else { return true }
//        let acceptableCharacters = "0123456789."
//        let characterSet = CharacterSet(charactersIn: acceptableCharacters)
//        let filteredString = string.components(separatedBy: characterSet)
//            .filter { !$0.isEmpty }
//            .joined()
//        if currency == .btc, !filteredString.hasSuffix("."), let text = textField.text {
//            let newText = (text as NSString).replacingCharacters(in: range, with: string)
//            let isTextPredicting = textField.markedTextRange != nil
//            let splitted = newText.splitted(with: ".")
//            // 小数点を含む入力の場合
//            if splitted.count > 2 {
//                guard splitted.count == 3 else { return false }
//                let digitsAfterDecimalPoint: Int = splitted.last!.count
//                let maxLength = LocalValidation.maxEnterBTCTextCount
//                // 超過する桁数の確定入力時
//                if !isTextPredicting, digitsAfterDecimalPoint > 0 {
//                    guard digitsAfterDecimalPoint < maxLength else { return false }
//                    textField.text = String(newText.prefix(splitted.first!.count + maxLength))
//                    // キャレットを調整する
//                    if let position = textField.position(from: textField.beginningOfDocument, offset: range.location + 1) {
//                        textField.selectedTextRange = textField.textRange(from: position, to: position)
//                    }
//                    return false
//                }
//            }
//        }
//        return string != filteredString
//    }
    
}

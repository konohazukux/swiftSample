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

    let disposeBag = DisposeBag()
    
    @IBOutlet var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        textField.keyboardType = .numberPad
//        textField.keyboardType = .alphabet
        addToolBar([textField])

        let temp: [String?] = ["0", nil, "3","0", nil,"7"]
      
        let sorted = temp.sorted(by: { a, b  in
            a.map { Int($0) ?? Int.max } ?? Int.max < b.map { Int($0) ?? Int.max } ?? Int.max
        })

        if let idx = temp.firstIndex(where: { ($0 ?? "0") != "0" }) as Int? {
            let temp2 = temp[idx...]
            print(temp2)
        }

        let nums = [1,2,3,4,5,6,7,8,9,0]
        let cuts = nums[2...5]
        let cuts2 = Array(cuts)
        print(cuts2)

//        print(idx)
//
//
//        print(temp)
//        print(sorted)
//        print(temp[3...])
        
        
    }
    private func addToolBar(_ textFields: [UITextField]) {
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        let doneButton = UIBarButtonItem(title: "表示", style: .done, target: self, action: #selector(donePressed))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.setItems([spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()

        for textField in textFields {
            textField.inputAccessoryView = toolBar
        }
    }

    @objc func donePressed() {
        textField.resignFirstResponder()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       
//        let identifier = "PointInquiryVC"
//        let storyboard = UIStoryboard(name: "PointInquiryVC", bundle: nil)
//        if let viewController = storyboard.instantiateInitialViewController() as? PointInfoVC {
//            present(viewController, animated: true, completion: nil)
//        }
      
        let string = "20080123"
        let c = Array(string)
        let year = c[0...3].reduce("") { $0 + String($1) }
        let mon  = c[4...5].reduce("") { $0 + String($1) }
        let day =  c[6...7].reduce("") { $0 + String($1) }
        
        let monI = Int(mon)
        

        do {
        let torihikiBi = "20080205"
        
            let c = Array(torihikiBi)
            let yy = "\(c[2])\(c[3])"
            let m = c[4] != "0" ? "\(c[4])\(c[5])" : "\(c[5])"
            let d = c[6] != "0" ? "\(c[6])\(c[7])" : "\(c[7])"
            print( "\(yy)/\(m)/\(d)")
            print("--------==")
        }

//        let identifier = "PointMenuVC"
//        let storyboard = UIStoryboard(name: "PointMenuVC", bundle: nil)
//        if let viewController = storyboard.instantiateInitialViewController() as? PointMenuVC {
//            viewController.modalPresentationStyle = .overCurrentContext
//            present(viewController, animated: true, completion: nil)
//        }

    }
}

extension FirstViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        let aSet = NSCharacterSet(charactersIn:"0123456789").inverted
        let compSepByCharInSet = string.components(separatedBy: aSet)
        let numberFiltered = compSepByCharInSet.joined(separator: "")
        return string == numberFiltered
    }
}

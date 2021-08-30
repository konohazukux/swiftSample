//
//  FirstViewController.swift
//  Sample1128
//
//  Created by TAKESHI SHIMADA on 2019/11/28.
//  Copyright © 2019 TAKESHI SHIMADA. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet var label: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        label.delegate = self
    }
}

extension FirstViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(string)
        return true
    }
}

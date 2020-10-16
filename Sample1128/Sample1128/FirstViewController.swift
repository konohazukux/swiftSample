//
//  FirstViewController.swift
//  Sample1128
//
//  Created by TAKESHI SHIMADA on 2019/11/28.
//  Copyright © 2019 TAKESHI SHIMADA. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        
        let temp1 = "ghjkl;".currencyInputFormatting()
        let temp2 = "11".currencyInputFormatting()
        let temp3 = "0".currencyInputFormatting()
        let temp4 = "-000123".currencyInputFormatting()
        let temp5 = "74hhf8474".currencyInputFormatting()
        let temp6 = "0".currencyInputFormatting(isShowZero: true)
        let temp7 = "56-7890".currencyInputFormatting(isShowZero: true)
        let temp8 = "-678976560".currencyInputFormatting(isShowZero: true)
        let temp9 = "45678-6544567".currencyInputFormatting(isShowZero: true)
        let temp10 = "0".currencyInputFormatting(isShowZero: true)
        let temp11 = "0".currencyInputFormatting(isShowZero: true)

        
        
    }
   
}


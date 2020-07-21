//
//  OneViewController.swift
//  Sample1128
//
//  Created by t shimada on 2020/07/21.
//  Copyright © 2020 TAKESHI SHIMADA. All rights reserved.
//

import UIKit

final class OneViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.init(red: 1, green: 0, blue: 0, alpha: 0.3)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //print("infolog:\(#line) \(type(of: self))  \(#function) : \(self) ")
    }

}

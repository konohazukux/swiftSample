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

        let navi = UINavigationController()
        let controller = MailAddressViewController()
        navi.modalPresentationStyle = .fullScreen
        navi.viewControllers = [controller]
        present(navi, animated: true, completion: nil)
        

        
    }

}


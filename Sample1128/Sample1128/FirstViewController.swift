//
//  FirstViewController.swift
//  Sample1128
//
//  Created by TAKESHI SHIMADA on 2019/11/28.
//  Copyright © 2019 TAKESHI SHIMADA. All rights reserved.
//

import UIKit
import PKHUD

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let navi = UINavigationController()
        let controller = MailAddressViewController()
        navi.modalPresentationStyle = .fullScreen
        navi.viewControllers = [controller]
        present(navi, animated: true, completion: nil)
      
//        let hud = PKHUD()
//        hud.show()
        
//        HUD.show(.progress)
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
//            HUD.hide()
//        }

//        let hud = HUDService()
//        hud.startIndicator(viewController: self)
//
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
//            hud.dismissIndicator()
//        }

    }

}



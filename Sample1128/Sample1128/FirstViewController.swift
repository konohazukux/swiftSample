//
//  FirstViewController.swift
//  Sample1128
//
//  Created by TAKESHI SHIMADA on 2019/11/28.
//  Copyright © 2019 TAKESHI SHIMADA. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import RxRelay

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        let vc = SampleViewController()
        vc.modalPresentationStyle = .popover
        vc.popoverPresentationController?.sourceView = sender.superview
        vc.popoverPresentationController?.sourceRect = sender.frame
        vc.popoverPresentationController?.permittedArrowDirections = .up // 矢印の向きを制限する場合
        vc.popoverPresentationController?.delegate = self // Phone で Popover を表示するために必要
        present(vc, animated: true)
    }
    
}

extension FirstViewController: UIPopoverPresentationControllerDelegate {
    // Phone で Popover を表示するために必要
    func adaptivePresentationStyle(
        for controller: UIPresentationController,
        traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }
}

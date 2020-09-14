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
import Lottie


class FirstViewController: UIViewController {

    let disposeBag = DisposeBag()
    
    @IBOutlet var textField: UITextField!

    @IBOutlet var lottieLoading: LottieAnimationView! {
        didSet {
            lottieLoading.loopMode = .loop
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        lottieLoading.animationName = "charging_dark"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        lottieLoading.play()
    }

}

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

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       
        let identifier = "PointInquiryVC"
        let storyboard = UIStoryboard(name: "PointInquiryVC", bundle: nil)
        if let viewController = storyboard.instantiateInitialViewController() as? PointInfoVC {
            present(viewController, animated: true, completion: nil)
        }
        

    }
}


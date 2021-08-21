//
//  FirstViewController.swift
//  Sample1128
//
//  Created by TAKESHI SHIMADA on 2019/11/28.
//  Copyright © 2019 TAKESHI SHIMADA. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class FirstViewController: UIViewController {

    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
       
        let sb = UIStoryboard.init(name: "PageViewController", bundle: nil)
        if let vc = sb.instantiateInitialViewController() {
            navigationController?.pushViewController(vc, animated: true)
        }

    }
}

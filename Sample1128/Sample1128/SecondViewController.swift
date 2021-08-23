//
//  SecondViewController.swift
//  Sample1128
//
//  Created by TAKESHI SHIMADA on 2021/08/23.
//  Copyright © 2021 TAKESHI SHIMADA. All rights reserved.
//

import UIKit
import RxSwift
import RxRelay

class SecondViewController: UIViewController {

   
    let disposeBag = DisposeBag()

    let sampleRelay = BehaviorRelay<String>(value: "ghjkl")
    
    deinit {
        print("14")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        performRelay()
    }

    func performRelay() {

        let relay = sampleRelay
            .debug("111 sdfinfolog-\(#line): \(type(of: self))", trimOutput: true)
            .subscribe(onNext: { val in
                print("34")
            })

//        relay.dispose()
        print("11")
        relay.disposed(by: disposeBag)
        print("12")
        
    }

}

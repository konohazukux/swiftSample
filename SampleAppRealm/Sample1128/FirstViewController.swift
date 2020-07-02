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
import SwiftDate
import RealmSwift
import Then

class FirstViewController: UIViewController {

    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.init(red: 0.9, green: 1, blue: 1, alpha: 1)
        
        test()

    }
    
    
    func test() {
      
        let request =
            TestRequest.init(snakeCaseParameters: .init(test: ""))
        
        
        request.test()

        
    }


}


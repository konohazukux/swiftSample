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

struct User: Codable {
    var name: String
}

var testCount = 0

class FirstViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var phoneTf: UITextField!
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var label1: UILabel!
    
    private var myButton: UIButton!
    let disposeBag = DisposeBag()
    let testRelay = PublishRelay<Int>()

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().layer.borderWidth = 0.5
        UITabBar.appearance().layer.borderColor = UIColor.clear.cgColor
        UITabBar.appearance().clipsToBounds = true
    }
}

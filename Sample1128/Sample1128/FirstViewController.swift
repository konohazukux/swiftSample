//
//  FirstViewController.swift
//  Sample1128
//
//  Created by TAKESHI SHIMADA on 2019/11/28.
//  Copyright © 2019 TAKESHI SHIMADA. All rights reserved.
//

import UIKit
import RxSwift
import RxRelay

class FirstViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var phoneTf: UITextField!
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!

    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let controller = HomeViewController()
        navigationController?.pushViewController(controller, animated: true)

    }
    

}

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
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    private var myButton: UIButton!
    let disposeBag = DisposeBag()
    let testRelay = PublishRelay<Int>()

    override func viewDidLoad() {
        super.viewDidLoad()

      
        let vc = Sample1ViewController()
        let navi = UINavigationController.init(rootViewController: vc)
        navi.modalPresentationStyle = .fullScreen
        present(navi, animated: true, completion: nil)
        
        
    }
}

class Sample1ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(red: 0, green: 1, blue: 1, alpha: 1)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            print("111 sdfinfolog-\(#line) \(type(of: self))  \(#function) : \(self) ")
            let vc = Sample2ViewController()
            self?.navigationController?.pushViewController(vc, animated: true)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            print("111 sdfinfolog-\(#line) \(type(of: self))  \(#function) : \(self) ")
            self?.dismiss(animated: true, completion: nil)
        }
    }
}

class Sample2ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(red: 0, green: 0, blue: 1, alpha: 1)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        let isMovingFromParent = self.isMovingFromParent
        print("111 sdfinfolog-\(#line) \(type(of: self))  \(#function) : \(isMovingFromParent) ")
    }
    
}


//
//  FirstViewController.swift
//  Sample1128
//
//  Created by TAKESHI SHIMADA on 2019/11/28.
//  Copyright © 2019 TAKESHI SHIMADA. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var phoneTf: UITextField!
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!

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
            let vc = Sample2ViewController()
            self?.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
}

class Sample2ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(red: 0, green: 1, blue: 0, alpha: 1)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            let vc = Sample3ViewController()
            self?.navigationController?.pushViewController(vc, animated: true)
        }

    }
}

class Sample3ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(red: 0, green: 0, blue: 1, alpha: 1)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            let vc = Sample4ViewController()
            self?.navigationController?.pushViewController(vc, animated: true)
        }

    }
}

class Sample4ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(red: 1, green: 1, blue: 0, alpha: 1)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in

            // a. popViewController
            //self?.navigationController?.popViewController(animated: true)

            // b. popToRootViewController
            if let vc2 = (self?.navigationController?.viewControllers.filter { $0.isKind(of: Sample3ViewController.self)})?.first {
                print("111 sdfinfolog-\(#line) \(type(of: self))  \(#function) : \(vc2) ")
                self?.navigationController?.popToRootViewController(animated: true)
            }
           
            // c. popToViewController
            //self?.navigationController?.popToViewController(vc2, animated: true)
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        let isMovingFromParent = self.isMovingFromParent
        let isBeingDismissed = self.isBeingDismissed
        print("111 sdfinfolog-\(#line) \(type(of: self))  \(#function) : \(isMovingFromParent) ")
        print("111 sdfinfolog-\(#line) \(type(of: self))  \(#function) : \(isBeingDismissed) ")
    }
}

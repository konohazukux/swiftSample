//
//  NotificationViewController.swift
//  Sample1128
//
//  Created by koharu shimada on 2020/05/15.
//  Copyright © 2020 TAKESHI SHIMADA. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift


class NotificationViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    var resultLabel: UILabel!
    var postButton: UIButton!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.systemYellow
        
        setView()
        setAccept()
        
        postButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.postNotification()
            })
            .disposed(by: disposeBag)

    }
  
    // set Notification
    let nName = Notification.Name("jp.test.leeJet.PasswordStore.items")
    
    func postNotification() {
        NotificationCenter.default.post(name: nName, object: nil)
    }
    
    func setAccept() {
        
        NotificationCenter.default.rx
            .notification(nName)
            .subscribe(onNext: {  _ in
                let now = Date().timeIntervalSince1970
                self.resultLabel.text = "now:  \(now)"
            })
            .disposed(by: disposeBag)
    }
    
}

extension NotificationViewController {
    func setView() {
        
        postButton = { () -> UIButton in
            let button = UIButton()
            self.view.addSubview(button)
            button.backgroundColor = UIColor.red
            button.setTitle("POST!!", for: .normal)
            button.tintColor = UIColor.black
            
            button.translatesAutoresizingMaskIntoConstraints = false
            button.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200).isActive = true
            button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            button.widthAnchor.constraint(equalToConstant: 100).isActive = true
            button.heightAnchor.constraint(equalToConstant: 30).isActive = true
            return button
        }()

        resultLabel = { () -> UILabel in
            let label = UILabel()
            self.view.addSubview(label)
            label.backgroundColor = UIColor.white
            label.translatesAutoresizingMaskIntoConstraints = false
            label.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 300).isActive = true
            label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            label.widthAnchor.constraint(equalToConstant: 300).isActive = true
            label.heightAnchor.constraint(equalToConstant: 50).isActive = true
            return label
        }()
    }
}

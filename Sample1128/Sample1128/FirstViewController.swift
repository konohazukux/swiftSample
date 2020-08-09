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
    
    @IBOutlet var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        logo()
    }

    lazy var logoStackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()


    func logo() {

        view.addSubview(logoStackView)
        logoStackView.arrangedSubviews.forEach { view in
            logoStackView.removeArrangedSubview(view)
            view.removeFromSuperview()
        }

        NSLayoutConstraint.activate([
            logoStackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200),
            logoStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            logoStackView.widthAnchor.constraint(equalToConstant: 200),
            logoStackView.heightAnchor.constraint(equalToConstant: 45)
        ])

        guard let image = UIImage.init(named: "bankPayHeaderImage") else { return }

        let logo = UIImageView()
//        logo.contentMode = .center
        logo.image = image
        logoStackView.addArrangedSubview(logo)

        NSLayoutConstraint.activate([
            logoStackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200),
            logoStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            logoStackView.widthAnchor.constraint(equalToConstant: 160),
            logoStackView.heightAnchor.constraint(equalToConstant: 30)
        ])

        
    }
}


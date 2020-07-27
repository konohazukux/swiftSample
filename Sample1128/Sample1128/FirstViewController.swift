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

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var phoneTf: UITextField!
    @IBOutlet weak var oneButton: UIButton!
    private var myButton: UIButton!
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 1)
        setui()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let vc = OneViewController()
        vc.modalPresentationStyle = .pageSheet
        vc.presentationController?.delegate = self
        present(vc, animated: true, completion: nil)
        
    }
    
    func setui() {
        var btnSettingCamera: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.backgroundColor = .systemYellow
            //button.titleLabel?.font = UIFont.hiraginoSansW6(16)
            button.setTitle("設定画面を開く", for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.layer.borderWidth = 2
            button.layer.borderColor = UIColor.white.cgColor
            button.layer.cornerRadius = 20
            //button.addTarget(self, action: #selector(openSettingCamera), for: .touchUpInside)
            let image = UIImage.init(named: "first")
            button.setImage(image, for: .normal)
            button.semanticContentAttribute = .forceRightToLeft //画像を右
            button.imageEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: -20)
            return button
        }()

        self.view.addSubview(btnSettingCamera)
        btnSettingCamera.translatesAutoresizingMaskIntoConstraints = false
        btnSettingCamera.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
        btnSettingCamera.widthAnchor.constraint(equalToConstant: 200).isActive = true
        btnSettingCamera.heightAnchor.constraint(equalToConstant: 150).isActive = true
        btnSettingCamera.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        view.layoutIfNeeded()

    }

}


extension FirstViewController: UIAdaptivePresentationControllerDelegate {
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        // ChildViewControllerのDismissを検知
        print("presentationControllerDidDismiss")
        
    }
    func presentationControllerShouldDismiss(_ presentationController: UIPresentationController) -> Bool {
        print("presentationControllerShouldDismiss")
        return true
    }
    func presentationControllerWillDismiss(_ presentationController: UIPresentationController) {
        print("presentationControllerWillDismiss")
    }
    func presentationControllerDidAttemptToDismiss(_ presentationController: UIPresentationController) {
        print("presentationControllerDidAttemptToDismiss")
    }

}

//
//  OneViewController.swift
//  Sample1128
//
//  Created by t shimada on 2020/07/21.
//  Copyright © 2020 TAKESHI SHIMADA. All rights reserved.
//

import UIKit

final class OneViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.init(red: 1, green: 0, blue: 0, alpha: 0.3)
            
        setui()
    }
    
    func setui() {
        var btnSettingCamera: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.backgroundColor = .systemYellow
            //button.titleLabel?.font = UIFont.hiraginoSansW6(16)
            button.setTitle("閉じる", for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.layer.borderWidth = 2
            button.layer.borderColor = UIColor.white.cgColor
            button.layer.cornerRadius = 20
            button.addTarget(self, action: #selector(openSettingCamera), for: .touchUpInside)
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
        btnSettingCamera.heightAnchor.constraint(equalToConstant: 50).isActive = true
        btnSettingCamera.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        view.layoutIfNeeded()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //print("infolog:\(#line) \(type(of: self))  \(#function) : \(self) ")
    }

    @objc func openSettingCamera(sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

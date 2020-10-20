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

class FirstViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var phoneTf: UITextField!
    @IBOutlet weak var oneButton: UIButton!
    private var myButton: UIButton!
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBar.appearance().layer.borderWidth = 0.5
        UITabBar.appearance().layer.borderColor = UIColor.clear.cgColor
        UITabBar.appearance().clipsToBounds = true


        UITabBar.appearance().shadowImage = UIImage.colorForNavBar(color: UIColor.white)
        UITabBar.appearance().backgroundImage = UIImage.colorForNavBar(color: UIColor.white)


        let user1 = User.init(name: "taro")
        let user2 = User.init(name: "taro2")
        let users = [ user1, user2]

        let someKey = Key<[User]>("someKey")
        Defaults.shared.set(users, for: someKey)

        
        if let temp = Defaults.shared.get(for: someKey) {
            print(temp)
            print(temp)

        }
    
        inputPaymentcodeAlert()
        
    }
    
    private func inputPaymentcodeAlert() {
        let alert = UIAlertController(title: "お支払いコード", message: "6桁のお支払いコードを入力してください。", preferredStyle: .alert)
        if #available(iOS 13, *) {
            alert.overrideUserInterfaceStyle = .light
        }
        alert.view.tintColor = UIColor.red
        // textfiledの追加
        alert.addTextField { [weak self] textField in
            // PlaceFolderなどあればここで実装
            textField.placeholder = "6桁のお支払いコード"
            textField.keyboardType = .numberPad
//            textField.delegate = self
        }

        // ①OK ボタン
        let okAction = UIAlertAction(title: "OK", style: .default, handler: { _ in
            // 入力された番号を取得
            let textField = alert.textFields?.first
//            self.createOrder(order: textField?.text ?? "", cardReference: nil)
        })
        alert.addAction(okAction)
        alert.preferredAction = okAction
        // ➁キャンセル　ボタン
        // ・キャンセルボタンを押すと、QR決済読取画面に戻る
        let cancelAction = UIAlertAction(title: "キャンセル", style: .cancel, handler: nil)
        alert.addAction(cancelAction)

        present(alert, animated: true, completion: nil)
    }
    

}

extension UIImage {
    class func colorForNavBar(color: UIColor) -> UIImage {
        let rect = CGRect.init(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        if let context = UIGraphicsGetCurrentContext() {
            context.setFillColor(color.cgColor)
            context.fill(rect)
            guard let image = UIGraphicsGetImageFromCurrentImageContext() else { return UIImage() }
            UIGraphicsEndImageContext()
            return image
        }
        return UIImage()
    }
}




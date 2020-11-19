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

        phoneTf.delegate = self
        
        UITabBar.appearance().shadowImage = UIImage.colorForNavBar(color: UIColor.white)
        UITabBar.appearance().backgroundImage = UIImage.colorForNavBar(color: UIColor.white)

        label.setColorToAttributedText(.red)
       
//        let temp = "abc―"
        let temp = "abc ー － — -"
        let temp2 = temp
            .replacingOccurrences(of: "ー", with: "-")
            .replacingOccurrences(of: "－", with: "-")
            .replacingOccurrences(of: "—", with: "-")
        print(temp2)
        print("--------")
        print("abc-")
        print("--------")
      
//        loadCodeMessageMap()
        
        readcsv()
    }

    func readcsv() {
        // ----- jsonファイル読み込み
        guard let path = Bundle.main.path(forResource: "apigee_error", ofType: "json") else { return }
        do {
            let jsonString: String = try String(contentsOfFile: path, encoding: .utf8)
//            let apigeeErrors = ApigeeError.generate(jsonString: jsonString)

        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    
    private func loadCodeMessageMap() -> String? {
        guard let path = Bundle.main.path(forResource: "error2", ofType: "csv") else {
            return nil
        }
        do {
            let csvString = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
            let csvLines = csvString.components(separatedBy: .newlines)
            print(csvLines)
            return ""
        } catch {
            return nil
        }
     }
}

extension FirstViewController: UITextFieldDelegate {
    
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

//sdf
//struct ApigeeErrorMessage {
//
//    //    static func generate(jsonString: String) -> [ApigeeError] {
//    //        guard let dic = jsonString.toJSONDict() else { return [] }
//    //        var apigeeErrors = [ApigeeError]()
//    //        for (key, value) in dic {
//    //            let errorCode = key
//    //            if let v = value as? [String: Any],
//    //                let code = v["code"] as? Int,
//    //                let message = v["message"] as? String,
//    //                let type = v["type"] as? Int {
//    //                let apigeeError = ApigeeError.init(errorCode: errorCode, code: code, message: message, type: type)
//    //                apigeeErrors.append(apigeeError)
//    //            }
//    //        }
//    //        return apigeeErrors
//    //    }
//
//
//}



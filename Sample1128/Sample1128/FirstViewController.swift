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

        phoneTf.delegate = self

        print(label1.accessibilityIdentifier ?? "")
        print(label1.accessibilityHint ?? "")
        print(label1.accessibilityLabel  ?? "")
        
        
//        Single<Int>.create { singleEvent in
//            self.testRelay.subscribe(onNext: { val in
//                singleEvent(.success(val))
//            })
//            .disposed(by: self.disposeBag)
//            return Disposables.create()
//            }
//            .subscribe(onSuccess: { val in
//                print("1:   \(val)")
//            })
//            .disposed(by: disposeBag)
//
//        testRelay.accept(3)

//        let testRelay = PublishRelay<Int>()
//        testRelay
//            .debug("infolog1:\(#line): \(type(of: self))", trimOutput: false)
//            .asObservable()
//            .debug("infolog2:\(#line): \(type(of: self))", trimOutput: false)
//            .subscribe(onNext: { val in
//                print("value:   \(val)")
//            })
//            .disposed(by: disposeBag)
//        testRelay.accept(3)
//
        
        
//        let testRelay = PublishRelay<Int>()
//        Single<Int>.just(2)
//            .flatMap { _ -> Single<Int> in
//                return testRelay.asSingle()
//            }
//            .subscribe(onSuccess: {
//                print("value:   \($0)")
//            })
//            .disposed(by: disposeBag)
//        testRelay.accept(3)


        
        
        let testRelay = PublishSubject<Int>()
        testRelay
            .asSingle()
            .subscribe(onSuccess: {
                print("value:   \($0)")
            })
            .disposed(by: disposeBag)
        
        let _ = Observable.just(3)
            .bind(to: testRelay)
//            .disposed(by: disposeBag)
        
        
//        Observable<Int>.just(2)
//            .asObservable()
//            .debug("infolog:\(#line): \(type(of: self))", trimOutput: true)
//            .flatMap { _ -> Observable<Int> in
//                return testRelay.asObservable()
//            }
//            .debug("infolog:\(#line): \(type(of: self))", trimOutput: true)
//        .asSingle()
//            .debug("infolog:\(#line): \(type(of: self))", trimOutput: true)
//        .subscribe(onSuccess: {
//            print("value:   \($0)")
//        })
//            .disposed(by: disposeBag)
//        testRelay.accept(3)

        
    }
    
//    func call() {
//        testCount = testCount + 1
//        testRelay.accept(testCount)
//
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//            if testCount < 8 {
//                self.call()
//            }
//        }
//    }
//
//
    func refresh() -> Single<Int> {
        return Single.create { singleEvent in
            singleEvent(.success(3))
            return Disposables.create()
        }
            
    }

    
    func test() -> Single<String> {
        print("infolog:\(#line) \(type(of: self))  \(#function) : \(self) ")
        return Single<String>.create { singleEvent in
            singleEvent(.success("test \(testCount)"))
            return Disposables.create()
        }
        .debug("infolog:\(#line): \(type(of: self))", trimOutput: true)
        .flatMap { val in
            testCount = testCount + 1
            print("test count \(testCount)")
            if testCount < 3 {
                return self.test()
                    .debug("infolog:\(#line): \(type(of: self))", trimOutput: true)
            }
            return Single.just(val)
        }
    }
    
    private func convertPercentString(_ val: Double?) -> String? {
        convertPercentString(val.map { String($0) })
    }

    private func convertPercentString(_ str: String?) -> String? {
        str.map {
            let currency = String($0).currencyInputFormatting(
                isShowZero: true,
                maximumFractionDigits: 3,
                minimumFractionDigits: 3
            )
            return "\(currency)%"
        }
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



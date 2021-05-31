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

        let string = "BankPay【MPM】決済要求に失敗しました。処理を中断します。error：jdebit_api_failed, error_description：E540001;7ad12115-bdbd-4fbf-b3d4-a5c4620a6697;2021-04-27 16:00:48, error_parameter：, error_detail_message：口座情報が無効化されています"
        let dic = parseCAFISError(string: string)
        print(dic)
    }

    // 下記のような string型のerror messageを dictionaryに変換します
    //  変換前: "BankPay【MPM】決済要求に失敗しました。処理を中断します。error：jdebit_api_failed, error_description：E540001;7ad12115-bdbd-4fbf-b3d4-a5c4620a6697;2021-04-27 16:00:48, error_parameter：, error_detail_message：口座情報が無効化されています"
    // 変換後: ["error": "jdebit_api_failed", "error_description": "E540001;7ad12115-bdbd-4fbf-b3d4-a5c4620a6697;2021-04-27 16:00:48", "error_detail_message": "口座情報が無効化されています", "error_parameter": ""]

    func parseCAFISError(string: String) -> [String: String] {
        let pattern = "(error.+?)(,|$)"
        let regex = try! NSRegularExpression(pattern: pattern, options: [])
        let results = regex.matches(in: string, options: [], range: NSRange(0..<string.count))
        var errorStrings = [String]()
        for result in results {
            let start = string.index(string.startIndex, offsetBy: result.range(at: 1).location)
            let end = string.index(start, offsetBy: result.range(at: 1).length)
            let text = String(string[start..<end])
            errorStrings.append(text)
        }
        return parseCAFISEachItem(errorStrings: errorStrings)
    }

    // 変換前: ["error：jdebit_api_failed", "error_description：E540001;7ad12115-bdbd-4fbf-b3d4-a5c4620a6697;2021-04-27 16:00:48", "error_parameter：", "error_detail_message：口座情報が無効化されています"]
    // 変換後: ["error": "jdebit_api_failed", "error_description": "E540001;7ad12115-bdbd-4fbf-b3d4-a5c4620a6697;2021-04-27 16:00:48", "error_detail_message": "口座情報が無効化されています", "error_parameter": ""]
    func parseCAFISEachItem(errorStrings: [String]) -> [String: String] {
        let pattern = "(error.*?)[:：](.*)"
        let regex = try! NSRegularExpression(pattern: pattern, options: [])
        var outputDic = [String: String]()
        
        for string in errorStrings {
            let results = regex.matches(in: string, options: [], range: NSRange(0..<string.count))
            
            for result in results {
                var key: String?
                var value: String = ""
                for i in 0..<result.numberOfRanges {
                    let start = string.index(string.startIndex, offsetBy: result.range(at: i).location)
                    let end = string.index(start, offsetBy: result.range(at: i).length)
                    let text = String(string[start..<end])
                    if i == 1 {
                        key = text
                    } else if i == 2 {
                        value = text
                    }
                }
                if let key = key {
                    outputDic[key] = value
                }
            }
        }
        return outputDic
    }

    
}

extension Array {
    /// 存在しない index を参照した場合 nil を戻す safe 配列参照
    func at(_ index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}

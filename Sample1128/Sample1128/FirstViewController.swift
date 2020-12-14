//
//  FirstViewController.swift
//  Sample1128
//
//  Created by TAKESHI SHIMADA on 2019/11/28.
//  Copyright © 2019 TAKESHI SHIMADA. All rights reserved.
//

import UIKit

enum TextFieldType: String, CaseIterable {
    /** 税込年収 */
    case nenshMn
    /** 借入残高合計 */
    case lnKrZngak
    /** 無担保 */
    case mtnpLKZngk
    /** 子供人数 */
}


class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white

        

        
    }

    func convertLargeSnakeToCamel(str: String) -> String {
        return Array(str).reduce(("", ""), {
            let strChar = $0.1 == "_" ? String($1) : $1.lowercased()
            let res = $1 == "_" ? $0.0 : $0.0 + strChar
            return (res, String($1))
            }).0
    }

    func replaceMatches(string: String, pattern: String, template: String, options: NSRegularExpression.Options) {

        // NSRegularExpressionのインスタンス生成
        guard let regex = try? NSRegularExpression(pattern: pattern, options: options) else {
            print("無効なパターン")
            return
        }

        // 置換実行
        let mstring = NSMutableString(string: string)
        let count = regex.replaceMatches(in: mstring, options: [], range: NSRange(0..<string.count), withTemplate: template)

        // 結果表示
        print(mstring)
        print("\(count)件置換しました")
    }

}


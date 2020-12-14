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
        

//        unsafeBitCast(<#T##x: T##T#>, to: <#T##U.Type#>)
        
//        let temp:TextFieldType = .nenshMn

        let temp = TextFieldType.allCases.first(where: { $0.rawValue == "mtnpLKZngk" })
        print(temp)
        

        
        
        let string = "HELLO_WORLD_HE_JLKJ"
//        let str = string.lowercased()
        let characters = Array(string)
        var shouldUpper = false
        var out = [String]()
        for char in characters {
            var c = shouldUpper ? String(char) : char.lowercased()
            shouldUpper = (char == "_")
            if char != "_" {
                out.append(c)
            }
        }
        var output = out.joined()
//        print(output)
//        print("---------------------------")
//        print("---------------------------")
       
//        characters.reduce(<#T##initialResult: Result##Result#>, <#T##nextPartialResult: (Result, Character) throws -> Result##(Result, Character) throws -> Result#>)
        let camel = convertLargeSnakeToCamel(str: string)
        print(camel)

        
        
      
//        let string = "Google, Amazon, Facebook, Apple"
//        let pattern = "[A-Z]+"
////        let pattern = "[B-Z][a-z]+"
//        let template = "[a-z]+"

//        replaceMatches(string: string, pattern: pattern, template: template, options: [.useUnicodeWordBoundaries])
        

//        let new = "ー−–—"
//            .replacingOccurrences(of: "–", with: "ー") //全角enダッシュ  「Option」＋「-(ハイフン)」
//            .replacingOccurrences(of: "—", with: "ー")  //全角emダッシュ 「Shift」＋「Option」＋「-(ハイフン)」
//            .replacingOccurrences(of: "−", with: "ー") //全角ハイフン
//
//        print(new)
//        print("--------")
        
//        ー : 全角のハイフン(E383BC)
//        − : 全角のマイナス(E28892)
//        – : ENダッシュ(E28093)
//        — : EMダッシュ(E28094)

        
        
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


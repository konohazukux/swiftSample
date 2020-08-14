//
//  Sample1128Tests.swift
//  Sample1128Tests
//
//  Created by TAKESHI SHIMADA on 2019/11/28.
//  Copyright © 2019 TAKESHI SHIMADA. All rights reserved.
//

import XCTest
@testable import Sample1128

class Sample1128Tests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFirstViewController() {
        
        let vc = FirstViewController()
        
        // 通常の入力
        do {
            let res = vc.editText(string: "", range: NSRange(location: 0, length: 0), replaceStr: "1")
            XCTAssertEqual(res.fixedString, "1")
            XCTAssertEqual(res.calletOffset, 1)
        }

        do {
            let res = vc.editText(string: "01", range: NSRange(location: 2, length: 0), replaceStr: "2")
            XCTAssertEqual(res.fixedString, "012 ")
            XCTAssertEqual(res.calletOffset, 4)
        }

        do {
            let res = vc.editText(string: "012", range: NSRange(location: 3, length: 0), replaceStr: "3")
            XCTAssertEqual(res.fixedString, "012 3")
            XCTAssertEqual(res.calletOffset, 5)
        }

        do {
            let res = vc.editText(string: "012 345", range: NSRange(location: 7, length: 0), replaceStr: "6")
            XCTAssertEqual(res.fixedString, "012 3456 ")
            XCTAssertEqual(res.calletOffset, 9)
        }
        
        do {
            let res = vc.editText(string: "012 3456 ", range: NSRange(location: 9, length: 0), replaceStr: "7")
            XCTAssertEqual(res.fixedString, "012 3456 7")
            XCTAssertEqual(res.calletOffset, 10)
        }

        do {
            let res = vc.editText(string: "012 3456 7", range: NSRange(location: 10, length: 0), replaceStr: "8")
            XCTAssertEqual(res.fixedString, "012 3456 78")
            XCTAssertEqual(res.calletOffset, 11)
        }

        // 文字列over
        do {
            let res = vc.editText(string: "012 3456 7890", range: NSRange(location: 13, length: 0), replaceStr: "1")
            XCTAssertEqual(res.fixedString, "012 3456 7890")
            XCTAssertEqual(res.calletOffset, 13)
        }

        // 削除
        do {
            let res = vc.editText(string: "0", range: NSRange(location: 0, length: 1), replaceStr: "")
            XCTAssertEqual(res.fixedString, "")
            XCTAssertEqual(res.calletOffset, 0)
        }


        do {
            let res = vc.editText(string: "012 ", range: NSRange(location: 2, length: 1), replaceStr: "")
            XCTAssertEqual(res.fixedString, "01")
            XCTAssertEqual(res.calletOffset, 2)
        }

        do {
            let res = vc.editText(string: "012 ", range: NSRange(location: 3, length: 1), replaceStr: "")
            XCTAssertEqual(res.fixedString, "01")
            XCTAssertEqual(res.calletOffset, 2)
        }

        do {
            let res = vc.editText(string: "012 345", range: NSRange(location: 6, length: 1), replaceStr: "")
            XCTAssertEqual(res.fixedString, "012 34")
            XCTAssertEqual(res.calletOffset, 6)
        }

        do {
            let res = vc.editText(string: "012 3456 ", range: NSRange(location: 7, length: 1), replaceStr: "")
            XCTAssertEqual(res.fixedString, "012 345")
            XCTAssertEqual(res.calletOffset, 7)
        }

        do {
            let res = vc.editText(string: "012 3456 ", range: NSRange(location: 8, length: 1), replaceStr: "")
            XCTAssertEqual(res.fixedString, "012 345")
            XCTAssertEqual(res.calletOffset, 7)
        }

        do {
            let res = vc.editText(string: "012 3456 7890", range: NSRange(location: 12, length: 1), replaceStr: "")
            XCTAssertEqual(res.fixedString, "012 3456 789")
            XCTAssertEqual(res.calletOffset, 12)
        }

        // 選択delete  delete "2 345"
        do {
            let res = vc.editText(string: "012 3456 7890", range: NSRange(location: 2, length: 5), replaceStr: "")
            XCTAssertEqual(res.fixedString, "016 7890 ")
            XCTAssertEqual(res.calletOffset, 2)
        }

        do { // delete "3456 7"
            let res = vc.editText(string: "012 3456 7890", range: NSRange(location: 4, length: 6), replaceStr: "")
            XCTAssertEqual(res.fixedString, "012 890")
            XCTAssertEqual(res.calletOffset, 4)
        }

        do { // delete " 3456 7"
            let res = vc.editText(string: "012 3456 7890", range: NSRange(location: 3, length: 7), replaceStr: "")
            XCTAssertEqual(res.fixedString, "012 890")
            XCTAssertEqual(res.calletOffset, 4)
        }

        // 複数文字paste
        do {
            let res = vc.editText(string: "012 345", range: NSRange(location: 2, length: 0), replaceStr: "99")
            XCTAssertEqual(res.fixedString, "019 9234 5")
            XCTAssertEqual(res.calletOffset, 5)
        }

        do {
            let res = vc.editText(string: "012 345", range: NSRange(location: 2, length: 0), replaceStr: "9999")
            XCTAssertEqual(res.fixedString, "019 9992 345")
            XCTAssertEqual(res.calletOffset, 7)
        }
        
        do { // 文字数オーバーのため追加文字が切られる
            let res = vc.editText(string: "012 345", range: NSRange(location: 2, length: 0), replaceStr: "999999")
            XCTAssertEqual(res.fixedString, "019 9999 2345")
            XCTAssertEqual(res.calletOffset, 9)
        }

        // 選択delete and paste
        do {  //"2 34" を選択した状態で"9999"をpaste
            let res = vc.editText(string: "012 3456 7", range: NSRange(location: 2, length: 4), replaceStr: "9999")
            XCTAssertEqual(res.fixedString, "019 9995 67")
            XCTAssertEqual(res.calletOffset, 7)
        }

        do {  //"2 3456 7" を選択した状態で"999999"をpaste
            let res = vc.editText(string: "012 3456 78", range: NSRange(location: 2, length: 8), replaceStr: "999999")
            XCTAssertEqual(res.fixedString, "019 9999 98")
            XCTAssertEqual(res.calletOffset, 10)
        }

        do {  //"2 3" を選択した状態で"999999"をpaste
            let res = vc.editText(string: "012 3456 78", range: NSRange(location: 2, length: 3), replaceStr: "999999")
            XCTAssertEqual(res.fixedString, "019 9994 5678")
            XCTAssertEqual(res.calletOffset, 7)
        }
    }
}

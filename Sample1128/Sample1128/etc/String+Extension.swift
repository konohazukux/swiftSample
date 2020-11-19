//
//  String+Extension.swift
//  Sample1128
//
//  Created by koharu shimada on 2020/08/14.
//  Copyright © 2020 TAKESHI SHIMADA. All rights reserved.
//

import Foundation
import UIKit

// static functions
extension String {
    static func isNullOrEmpty(_ value: String?) -> Bool {
        guard let value = value else { return true }
        return value.isEmpty
    }
}

private let halfWidthNumbers = CharacterSet(charactersIn: "0123456789")

extension String {
    // 文字列中の文字の距離を取得する
    func indexDistance(of character: Character) -> Int? {
        guard let index = firstIndex(of: character) else { return nil }
        return distance(from: startIndex, to: index)
    }

    static let shortDateUS: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateStyle = .short
        return formatter
    }()

    // 短い日付を取得する
    var shortDateUS: Date? {
        String.shortDateUS.date(from: self)
    }

    // 幅とフォントで文字列の高さを取得する
    func heightWithConstrainedWidth(width: CGFloat, font: UIFont?) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = (self as NSString).boundingRect(with: constraintRect, options: [.usesLineFragmentOrigin, .usesFontLeading], attributes: [.font: font as Any], context: nil)
        return boundingBox.height
    }

    var digit: String {
        let simple = folding(options: [.diacriticInsensitive, .widthInsensitive, .caseInsensitive], locale: nil)
        let charSet = NSCharacterSet(charactersIn: "0123456789").inverted
        return simple.components(separatedBy: charSet).joined()
    }

    // 文字列をローカライズする
    public var localized: String {
        NSLocalizedString(self, comment: self)
    }

    // 長さを検証する
    func validateLength(size: (min: Int, max: Int)) -> Bool {
        (size.min ... size.max).contains(count)
    }

    // 文字列のフォローパターンを検証する
    public func validate(pattern: String) -> Bool {
        let test = NSPredicate(format: "SELF MATCHES %@", pattern)
        return test.evaluate(with: self)
    }

    var isHalfWidth: Bool {
        count == utf8.count
    }

    /// 「漢字」かどうか
    var isKanji: Bool {
        let range = "^[\u{3005}\u{3007}\u{303b}\u{3400}-\u{9fff}\u{f900}-\u{faff}\u{20000}-\u{2ffff}]+$"
        return NSPredicate(format: "SELF MATCHES %@", range).evaluate(with: self)
    }

    /// 「ひらがな」かどうか
    var isHiragana: Bool {
        let range = "^[ぁ-ゞ]+$"
        return NSPredicate(format: "SELF MATCHES %@", range).evaluate(with: self)
    }

    /// 「カタカナ」かどうか
    var isKatakana: Bool {
        let range = "^[ァ-ヾ]+$"
        return NSPredicate(format: "SELF MATCHES %@", range).evaluate(with: self)
    }

    /// JIS（ISO2022JP）に含まれる文字かどうか // selfは単語ではなく1文字だけで使用すること
    var isValid: Bool {
        // exceptionCharに入れているのは、JISに含まれるがエンコードでnilになってしまう文字
        let exceptionChar = "―～∥－￠￡￢"
        if data(using: .iso2022JP) != nil, !isHankakuNumber {
            return true
        } else if exceptionChar.contains(self) {
            return true
        } else {
            return false
        }
    }

    /// 半角数字かどうか
    var isHankakuNumber: Bool {
        range(of: "[^0-9]+", options: .regularExpression) == nil && self != ""
    }

    /// 半角数字の整数ならばtrue
    var isInteger: Bool {
        !isEmpty && rangeOfCharacter(from: halfWidthNumbers.inverted) == nil
    }

    /// 「全角カタカナ」かどうか
    var isZenkakuKatakana: Bool {
        let range = "^[ァ-ヾ]+$"
        guard let regex = try? NSRegularExpression(pattern: range, options: .caseInsensitive) else {
            return false
        }
        let result = regex.matches(in: self, options: [], range: NSRange(location: 0, length: count))
        return !result.isEmpty
    }

    /// 「ひらがな」に変換 ※１
    var toHiragana: String? {
        applyingTransform(.hiraganaToKatakana, reverse: false)
    }

    /// 「カタカナ」に変換
    var toKatakana: String? {
        applyingTransform(.hiraganaToKatakana, reverse: true)
    }

    /// 「ひらがな」を含むかどうか ※2
    var hasHiragana: Bool {
        guard let hiragana = toKatakana else { return false }
        return self != hiragana // １文字でもカタカナに変換されている場合は含まれると断定できる
    }

    /// 「カタカナ」を含むかどうか
    var hasKatakana: Bool {
        guard let katakana = toHiragana else { return false }
        return self != katakana // １文字でもひらがなに変換されている場合は含まれると断定できる
    }

    /// 「4桁 4桁 残りの桁」のフォーマットに整形します
    var barcodeFormat: String {
        #if DEVELOP
            let barcode: String = "1234567890" //! < STUBの場合、"String"が返却されるため
        #else
            let barcode: String = self
        #endif

        if barcode.isEmpty { return "" }

        let top = barcode.prefix(4),
            middle = barcode[barcode.index(
                barcode.startIndex,
                offsetBy: 4
            ) ..< barcode.index(
                barcode.startIndex,
                offsetBy: 8
            )],
            bottom = barcode.suffix(barcode.count - 8)

        return "\(top) \(middle) \(bottom)"
    }

    func transformFullWidthKanaToHalfwidthKana(reverse: Bool = false) -> String {
        var transformedChars: [String] = []

        let chars = map { String($0) }
        chars.forEach {
            let halfwidthChar = NSMutableString(string: $0) as CFMutableString
            CFStringTransform(halfwidthChar, nil, kCFStringTransformFullwidthHalfwidth, false)
            let char = halfwidthChar as String

            CFStringTransform(halfwidthChar, nil, kCFStringTransformFullwidthHalfwidth, reverse)
            transformedChars.append(halfwidthChar as String)
        }

        var transformedString = ""
        transformedChars.forEach { transformedString += $0 }

        return transformedString
    }
}

extension String {
    func currencyInputFormatting() -> String {
        var number: NSNumber!
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = ""
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 0

        let amountWithPrefix = removeCurrencySymbol()

        guard amountWithPrefix != "" else { return "" }

        let double = (amountWithPrefix as NSString).doubleValue
        number = NSNumber(value: double)
        guard number != 0 as NSNumber else {
            return ""
        }
        return formatter.string(from: number)!
    }

    func removeCurrencySymbol() -> String {
        let regex = try! NSRegularExpression(pattern: "[^0-9-]", options: .caseInsensitive)
        return regex.stringByReplacingMatches(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSRange(location: 0, length: count), withTemplate: "")
    }
}

extension String {
    func dateStr8digitToYYYYMDFormat() -> String? {
        // ex. 20200402 -> 2020/4/2
        let dateStr = self
        let yearStr = dateStr.prefix(4)
        let monthStr = dateStr[dateStr.index(dateStr.startIndex, offsetBy: 4) ..< dateStr.index(dateStr.startIndex, offsetBy: 6)]
        let dayStr = dateStr.suffix(2)
        guard let intYear = Int(yearStr), let intMonth = Int(monthStr), let intDay = Int(dayStr) else { return nil }
        let ymdDateStr = String(intYear) + "/" + String(intMonth) + "/" + String(intDay)
        return ymdDateStr
    }

    func dateStr8digitToYYMDFormat() -> String? {
        // ex. 20200402 -> 20/4/2
        let dateStr = self
        let yearStr = dateStr[dateStr.index(dateStr.startIndex, offsetBy: 2) ..< dateStr.index(dateStr.startIndex, offsetBy: 4)]
        let monthStr = dateStr[dateStr.index(dateStr.startIndex, offsetBy: 4) ..< dateStr.index(dateStr.startIndex, offsetBy: 6)]
        let dayStr = dateStr.suffix(2)
        guard let intYear = Int(yearStr), let intMonth = Int(monthStr), let intDay = Int(dayStr) else { return nil }
        let ymdDateStr = String(intYear) + "/" + String(intMonth) + "/" + String(intDay)
        return ymdDateStr
    }
}

extension UILabel {
    func setColorToAttributedText(_ color: UIColor) {
        if let attributedText = self.attributedText?.mutableCopy() as? NSMutableAttributedString {
            let text = attributedText.string
            attributedText.addAttribute(
                .foregroundColor,
                value: UIColor.red,
                range: NSMakeRange(0, text.count)
            )
            self.attributedText = attributedText
            self.textColor = color
        }
    }
}

/// extension String
extension String {
    /// JSON形式の文字列をDictionary型に変換
    /// UTF8に限定しているので、他に対応する必要がある場合は改良が必要
    ///
    /// - Returns: 変換後のDictionary
    func toJSONDict() -> [String: Any]? {
        guard let jsonData = data(using: .utf8) else {
            // String→Data変換失敗
            return nil
        }
        do {
            // QRコードから取得した値をJSONに直して使用する
            let json = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.allowFragments)
            let dict = json as? [String: Any]
            return dict
        } catch {
            // Data→JSON失敗
            return nil
        }
    }

    var isNotEmpty: Bool {
        !isEmpty
    }
}

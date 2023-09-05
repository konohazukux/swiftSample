//
//  Date+Extended.swift
//  Sample1128
//
//  Created by t shimada on 2020/08/01.
//  Copyright © 2020 TAKESHI SHIMADA. All rights reserved.
//

import Foundation

enum DateFormatType: String {
    case yyyyMMddHyphenTHHmmssSSSZ = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    case yyyyMMddHyphenTHHmmssZ = "yyyy-MM-dd'T'HH:mm:ssZ"
    case yyyyMMddHyphenTHHmmss = "yyyy-MM-dd'T'HH:mm:ss"
    case yyyyMMddHHmmss
    case yyyMMddHyphen = "yyy-MM-dd"
    case yyyyMMddSlash = "yyyy/MM/dd"
    case yyyyMMddSlashHHmm = "yyyy/MM/dd HH:mm"
    case yyyyMMddHyphenHHmm = "yyyy-MM-dd HH:mm"
    case yyyyMMddHyphenHHmmss = "yyyy-MM-dd HH:mm:ss"
    case yyyyMdSlashHHmm = "yyyy/M/d HH:mm"
}

extension DateFormatter {
    fileprivate static var defaultFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone.current
        return formatter
    }()

    func format(_ dateFormat: String) -> DateFormatter {
        self.dateFormat = dateFormat
        return self
    }
}

private extension Date {
    static var defaultFormatter: DateFormatter {
        DateFormatter.defaultFormatter
    }
}

extension Date {
    static func convertAPIResponseStringToDate(_ string: String) -> Date? {
        let dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        return Date.defaultFormatter.format(dateFormat).date(from: string)
    }

    /// 銀行Pay専用の日付え変更フォーマット対応
    static func convertGinkoPayStringToDate(_ string: String) -> Date? {
        let dateFormat = DateFormatType.yyyyMMddHyphenTHHmmss.rawValue
        return Date.defaultFormatter.format(dateFormat).date(from: string)
    }

    static func convertAPIResponseIntToDate(_ int: Int) -> Date? {
        let dateFormat = "yyyyMMddHHmmss"
        return Date.defaultFormatter.format(dateFormat).date(from: int.description)
    }

    static func convertStringToDate(_ string: String) -> Date? {
        let dateFormat = "yyy-MM-dd"
        return Date.defaultFormatter.format(dateFormat).date(from: string)
    }

    static func convertToDate(_ string: String, format: DateFormatType) -> Date? {
        let formatter = Date.defaultFormatter
        formatter.timeZone = TimeZone(secondsFromGMT: 9 * 60 * 60)
        return Date.defaultFormatter.format(format.rawValue).date(from: string)
    }

    static func convertToString(_ string: String, current: DateFormatType, formated: DateFormatType) -> String? {
        let formatter = Date.defaultFormatter
        formatter.timeZone = TimeZone(secondsFromGMT: 9 * 60 * 60)
        if let date = Date.defaultFormatter.format(current.rawValue).date(from: string) {
            return formatter.format(formated.rawValue).string(from: date)
        }
        return nil
    }
}

extension Date {
    func toYYYYMMddHHmmString() -> String {
        let dateFormat = "yyyy/MM/dd HH:mm"
        return Date.defaultFormatter.format(dateFormat).string(from: self)
    }

    func toYYYYMMddString() -> String {
        let dateFormat = "yyyy/MM/dd"
        return Date.defaultFormatter.format(dateFormat).string(from: self)
    }
}

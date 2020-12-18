//
//  APIResult.swift
//  Sample1128
//
//  Created by TAKESHI SHIMADA on 2020/11/19.
//  Copyright © 2020 TAKESHI SHIMADA. All rights reserved.
//

import SwiftyJSON

struct ErrorAPIResult {
    var message: String?
    var errors: [ErrorListResult]?
}

struct ErrorListResult {
    var resource: String
    var field: String
    var code: String
}

extension ErrorListResult {
    mutating func map(json: JSON) -> ErrorListResult {
        ErrorListResult(resource: json["resource"].stringValue,
                        field: json["field"].stringValue,
                        code: json["code"].stringValue)
    }
}

// APIを呼び出すとき　ケースエラー
enum APIError {
    case noInternetConnection
    case request(reason: String)
    case parsing
    case unknow
}

//
//  ErrorCode.swift
//  Sample1128
//
//  Created by TAKESHI SHIMADA on 2020/11/19.
//  Copyright © 2020 TAKESHI SHIMADA. All rights reserved.
//

import Foundation

protocol ErrorAPI {
    var title: String? { get }
    var des: String { get }
    var btn1: String? { get }
    var btn2: String? { get }
}

struct ErrorFromServer: Error {
    var msg: String?
    var errors: [ErrorListResult]?
    var code: ErrorCode = .unknown
    var errorCodeString: String?
    
    init(msg: String?, errors: [ErrorListResult]?, code: ErrorCode?) {
        self.init(msg: msg, errors: errors, code: code, errorCodeString: nil)
    }
    
    init(msg: String?, errors: [ErrorListResult]?, code: ErrorCode?, errorCodeString: String?) {
        self.msg = msg
        self.errors = errors
        self.code = code ?? .unknown
        if let errorCode = errorCodeString {
            self.errorCodeString = errorCode
        } else if let rawValue = code?.rawValue {
            self.errorCodeString = String(rawValue)
        }
    }
    
    init(_ msg: String) {
        self.msg = msg
    }
    
    init(_ code: ErrorCode?) {
        self.code = code ?? .unknown
        if let rawValue = code?.rawValue {
            self.errorCodeString = String(rawValue)
        }
    }
    
    init(errorCodeString: String) {
        self.errorCodeString = errorCodeString
    }
    
    /// エラーコード番号はサーバーから返されます
    enum ErrorCode: Int {
        case unknown = -1
        case badRequest = 400
        case unauthorised = 401
        case paymentRequired = 402
        case forbidden = 403
        case notFound = 404
        case timeout = 408
        case tooManyRequest = 429
        case serverError = 500
        case serviceUnavailable = 503
        case gatewayTimeout = 504
        case networkError = 8081
    }
}

extension ErrorFromServer {
    /// エラーの説明はサーバーから返されます
    var errorListDescription: [ErrorListResult]? {
        if let errors_map = errors { return errors_map }
        return nil
    }
    
    var localizedDescription: String { errorDescription }
    
    var errorDescription: String {
        if let errorCodeString = self.errorCodeString { return errorCodeString.localized }
        if let message = msg { return message }
        switch code {
        case .unknown:
            return "NoneError".localized
        case .badRequest:
            return "BadRequest".localized
        case .unauthorised:
            return "Unauthorised".localized
        case .paymentRequired:
            return "PaymentRequired".localized
        case .forbidden:
            return "Forbidden".localized
        case .notFound:
            return "NotFound".localized
        case .timeout:
            return "Timeout".localized
        case .tooManyRequest:
            return "TooManyRequest".localized
        case .serverError:
            return "ServerError".localized
        case .serviceUnavailable:
            return "ServiceUnavailable".localized
        case .networkError:
            return "NetworkError".localized
        case .gatewayTimeout:
            return "Timeout".localized
        }
    }
}

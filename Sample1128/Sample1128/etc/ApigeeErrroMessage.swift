//
//  ApigeeErrroMessage.swift
//  Sample1128
//
//  Created by TAKESHI SHIMADA on 2020/11/19.
//  Copyright © 2020 TAKESHI SHIMADA. All rights reserved.
//

import Foundation

//sdf
struct ApigeeErrorMessage {
    
    let apigeeErrorCode: String
    let errorDetail: ErrorDetail

    struct ErrorDetail {
        let code: Int
        let message: String
        let type: Int //HandleType
    }

    enum  HandleType {
        case CLOSE
        case GOTO_HOME
        case GOTO_LOGIN
        case SHOW_HIGHLIGHT
        case SHOW_UPPER
        case UNKNOWN
    }

    static func generate(errorFromServer: ErrorFromServer) -> [ApigeeErrorMessage] {
        (errorFromServer.errors ?? []).compactMap {
            ApigeeErrorMessage.temp(errorListResult: $0)
        }
    }
    
    static func temp(errorListResult: ErrorListResult) -> ApigeeErrorMessage? {
        guard let path = Bundle.main.path(forResource: "apigee_error", ofType: "json"),
            let jsonString = try? String(contentsOfFile: path, encoding: .utf8),
            let dic = jsonString.toJSONDict(),
            let v = dic[errorListResult.code] as? [String: Any],
            let code = v["code"] as? Int,
            let message = v["message"] as? String,
            let type = v["type"] as? Int else { return nil }
        
        return .init(
            apigeeErrorCode: errorListResult.code,
            errorDetail: .init(
                code: code,
                message: message,
                type: type
            )
        )
    }

}

//extension ApigeeErrorMessage {
//    init?(errorListResult: ErrorListResult) {
//        guard let path = Bundle.main.path(forResource: "apigee_error", ofType: "json") else {
//            fatalError()
//        }
//        do {
//            let jsonString: String = try String(contentsOfFile: path, encoding: .utf8)
//            if let dic = jsonString.toJSONDict(),
//                let v = dic[errorListResult.code] as? [String: Any],
//            let code = v["code"] as? Int,
//            let message = v["message"] as? String,
//            let type = v["type"] as? Int {
//                self.apigeeErrorCode = errorListResult.code
//                self.errorDetail = .init(code: code, message: message, type: type)
//            }
//        } catch let error as NSError {
//            print(error.localizedDescription)
//            fatalError()
//        }
//    }
//}
//
//struct temp {
//    let temp1: String
//}




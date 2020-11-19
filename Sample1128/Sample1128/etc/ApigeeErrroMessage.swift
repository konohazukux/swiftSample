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

    struct ErrorDetail {
        let code: Int
        let message: String
        let type: HandleType
    }

    enum  HandleType {
        case CLOSE
        case GOTO_HOME
        case GOTO_LOGIN
        case SHOW_HIGHLIGHT
        case SHOW_UPPER
        case UNKNOWN
    }
    
    

    //        static func generate(jsonString: String) -> [ApigeeError] {
    //            guard let dic = jsonString.toJSONDict() else { return [] }
    //            var apigeeErrors = [ApigeeError]()
    //            for (key, value) in dic {
    //                let errorCode = key
    //                if let v = value as? [String: Any],
    //                    let code = v["code"] as? Int,
    //                    let message = v["message"] as? String,
    //                    let type = v["type"] as? Int {
    //                    let apigeeError = ApigeeError.init(errorCode: errorCode, code: code, message: message, type: type)
    //                    apigeeErrors.append(apigeeError)
    //                }
    //            }
    //            return apigeeErrors
    //        }

    
    


}





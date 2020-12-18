//
//  ApigeeErrroMessage.swift
//  Sample1128
//
//  Created by TAKESHI SHIMADA on 2020/11/19.
//  Copyright © 2020 TAKESHI SHIMADA. All rights reserved.
//

import Foundation

//sdf
struct ApigeeError {
    
    let apigeeErrorCode: String
    let errorDetail: ErrorDetail

    struct ErrorDetail {
        let code: Int
        let message: String
        let type: Int
        let handleType: HandleType
    }

    enum  HandleType {
        case showError
        case showErrorAndGotoHome
        case showErrorAndGotoLogin
        case showHightLight
        case showHightLightWithBack
        case showUpper
        case unknown
    }

    static func getApigeeErrors(errorFromServer: ErrorFromServer) -> [ApigeeError] {
        (errorFromServer.errors ?? []).compactMap {
            ApigeeError.init(errorListResult: $0)
        }
    }
}

extension ApigeeError {
    init?(errorListResult: ErrorListResult) {
        // apigee_error.jsonファイルはAndroidと共通のものを使用
        guard let path = Bundle.main.path(forResource: "apigee_error", ofType: "json"),
            let jsonString = try? String(contentsOfFile: path, encoding: .utf8),
            let errorDetail = ApigeeError.ErrorDetail(
                jsonString: jsonString,
                apigeeErrorCode: errorListResult.code) else { return nil }
    
        self.apigeeErrorCode = errorListResult.code
        self.errorDetail = errorDetail
    }
}

extension ApigeeError.ErrorDetail {
    init?(jsonString: String, apigeeErrorCode: String) {
        guard let dic = jsonString.toJSONDict(),
            let value = dic[apigeeErrorCode] as? [String: Any],
            let code = value["code"] as? Int,
            let message = value["message"] as? String,
            let type = value["type"] as? Int else { return nil }
       
        self.code = code
        self.message = message
        self.type = type
        self.handleType = { () -> ApigeeError.HandleType in
            switch type {
            case 1:
                return .showError
            case 2:
                if gotoHomeCodes.contains(apigeeErrorCode) {
                    return .showErrorAndGotoHome
                } else if gotoLoginCodes.contains(apigeeErrorCode) {
                    return .showErrorAndGotoLogin
                } else {
                    return .unknown
                }
            case 3:
                if gotoBackCodes.contains(apigeeErrorCode) {
                    return .showHightLightWithBack
                    
                } else {
                    return .showHightLight
                }
            case 4:
                return .showUpper
            default:
                return .unknown
            }
        }()

    }
    
}

fileprivate let gotoHomeCodes:[String] = [
    "RG0017T-1002",
    "RM0001R-2001",
    "RM0001R-2003",
    "RM0002R-2001",
    "RM0002R-2003",
    "RM0007C-2013",
    "RM0007T-2013",
    "RM0011C-2004",
    "RM0011C-2005",
    "RM0011C-2007",
    "RM0011R-2005",
    "RM0011R-2006",
    "RM0011R-2008",
    "RM0011T-2004",
    "RM0011T-2005",
    "RM0011T-2007",
    "RM0012C-2004",
    "RM0012C-2005",
    "RM0012C-2007",
    "RM0012R-2005",
    "RM0012R-2006",
    "RM0012R-2008",
    "RM0012T-2004",
    "RM0012T-2005",
    "RM0012T-2007",
    "RM0014R-2003",
    "RM0015C-2009",
    "RM0015T-2008",
    "RM0016C-2004",
    "RM0017C-2002",
    "RM0017C-2006",
    "RM0017C-2007",
    "RM0017C-2011",
    "RM0017C-2012",
    "RM0017T-2003",
    "RM0017T-2008",
    "RM0017T-2009",
    "RM0017T-2012",
    "RM0017T-2013",
    "RM0019R-2001",
    "RM0019R-2002",
    "RM0011R-2005",
    "TO0004R-001-0000",
    "TO0004R-027-0000",
    "TO0022U-001-0000",
    "TO0022U-027-0000",
]

fileprivate let gotoLoginCodes:[String] = [
    "RM0010C-2011",
    "RM0010C-2012",
]

fileprivate let gotoBackCodes:[String] = [
    "RM0007C-1002",
    "RM0007C-1003",
    "RM0010C-1002",
    "RM0010C-1003",
    "RM0010C-1004",
    "RM0011C-1002",
    "RM0011C-1003",
    "RM0011C-1004",
    "RM0012C-1002",
    "RM0012C-1003",
    "RM0012C-1004",
    "RM0015C-1002",
    "RM0015C-1003",
    "RM0015C-1004",
    "RM0017C-1002",
    "RM0017C-1003",
    "RM0017C-1004",
]




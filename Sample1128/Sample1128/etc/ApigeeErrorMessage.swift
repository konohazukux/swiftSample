//
//  ApigeeErrorMessage.swift
//  Sample1128
//
//  Created by TAKESHI SHIMADA on 2020/11/19.
//  Copyright © 2020 TAKESHI SHIMADA. All rights reserved.
//

import Foundation

struct ApigeeErrorMessage {
    private static let defaultMessage = "お客さまの情報が正しく取得できませんでした。詳しくはトヨタファイナンスまでお問合せください。"
    private static var codeMessageMap = loadCodeMessageMap()
    
    private let serverError: ErrorFromServer
    private let apigeeErrors: [ApigeeError]
    
    init(serverError: ErrorFromServer) {
        self.serverError = serverError
        self.apigeeErrors = ApigeeError.getApigeeErrors(errorFromServer: serverError)
    }
    
    var single: String? {
        guard let firstError = serverError.errors?.first else { return nil }
        return getMessage(errorListResult: firstError)
    }
    
    var all: [String] {
        serverError.errors?.map { getMessage(errorListResult: $0) } ?? []
    }
    
    var allCodeMessage: [(code: String, message: String)] {
        serverError.errors?.map { (code: $0.code, message: getMessage(errorListResult: $0)) } ?? []
    }
    
    private func getMessage(errorListResult: ErrorListResult) -> String {
      
        guard let apigeeError = (Self.codeMessageMap.filter { $0.apigeeErrorCode == errorListResult.code }).first else {
            return Self.defaultMessage
        }
        if errorListResult.field.isNotEmpty {
            return apigeeError.errorDetail.message.replacingOccurrences(of: "{0}", with: errorListResult.field)
        } else {
            return apigeeError.errorDetail.message
        }
    }
    
    private static func loadCodeMessageMap() -> [ApigeeError] {
//        guard let path = Bundle.main.path(forResource: "ApigeeError", ofType: "plist") else { return [:] }
//        let url = URL(fileURLWithPath: path)
//        do {
//            let data = try Data(contentsOf: url)
//            if let map = try PropertyListSerialization.propertyList(from: data, options: .mutableContainers, format: nil) as? [String: String] {
//                return map
//            }
//        } catch {}
//        return [:]
        return []
    }
   
    
}

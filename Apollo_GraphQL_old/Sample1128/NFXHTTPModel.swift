//
//  NFXHTTPModel.swift
//  Sample1128
//
//  Created by TAKESHI SHIMADA on 2021/05/31.
//  Copyright © 2021 TAKESHI SHIMADA. All rights reserved.
//

import Foundation


@objc public class NFXHTTPModel: NSObject, Codable
{
    @objc public var requestURL: String?
//    @objc public var requestURLComponents: URLComponents?
//    @objc public var requestURLQueryItems: [URLQueryItem]?
    @objc public var requestMethod: String?
    @objc public var requestCachePolicy: String?
}

struct NFXHTTPData: Codable
{
    public var requestURL: String?
//    public var requestURLComponents: URLComponents?
//    public var requestURLQueryItems: [URLQueryItem]?
    public var requestMethod: String?
    public var requestCachePolicy: String?
    
    public var requestHeaders: [String: String]?

}


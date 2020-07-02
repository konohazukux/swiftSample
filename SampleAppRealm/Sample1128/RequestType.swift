//
//  Keisyou.swift
//  Sample1128
//
//  Created by koharu shimada on 2020/06/15.
//  Copyright © 2020 TAKESHI SHIMADA. All rights reserved.
//

import Foundation

protocol RequestType: Request2 {}

extension RequestType {
    func test() {
        print("infolog:\(#line) \(type(of: self))  \(#function) : \(self) ")
    }
}

protocol SnakeCase {}
extension RequestType where Self: SnakeCase {
    func test() {
        print("infolog:\(#line) \(type(of: self))  \(#function) : \(self) ")
    }
}

protocol HasSnakeCaseParameters {
  associatedtype SnakeCaseParameters: Encodable
  var snakeCaseParameters: SnakeCaseParameters { get }
}
extension RequestType where Self: HasSnakeCaseParameters {
    var path: String {
        print(snakeCaseParameters)
        return ""
    }
}

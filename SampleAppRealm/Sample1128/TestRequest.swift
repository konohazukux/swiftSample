//
//  TestRequest.swift
//  Sample1128
//
//  Created by koharu shimada on 2020/06/15.
//  Copyright © 2020 TAKESHI SHIMADA. All rights reserved.
//

import Foundation

struct TestRequest: RequestType, SnakeCase, HasSnakeCaseParameters {

    var path: String {
        return "test"
    }
    
    typealias SnakeCaseParameters = Params

    var snakeCaseParameters: TestRequest.Params

  
    struct Params: Codable {
        let test: String
    }
}




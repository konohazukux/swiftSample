//
//  User.swift
//  Sample1128
//
//  Created by TAKESHI SHIMADA on 2023/04/20.
//  Copyright © 2023 TAKESHI SHIMADA. All rights reserved.
//

import Foundation

struct User: Codable, Identifiable {
    let id: Int
    let name: String
    let username: String
}



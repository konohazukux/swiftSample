//
//  Product.swift
//  Sample1128
//
//  Created by TAKESHI SHIMADA on 2023/05/06.
//  Copyright © 2023 TAKESHI SHIMADA. All rights reserved.
//

import Foundation
import FirebaseFirestore

struct Product: Codable, Identifiable {
    var id: String? = nil
    let name: String
    let code: String
}


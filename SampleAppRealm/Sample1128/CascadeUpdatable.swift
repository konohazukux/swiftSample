//
//  CascadeUpdatable.swift
//  Sample1128
//
//  Created by koharu shimada on 2020/06/03.
//  Copyright © 2020 TAKESHI SHIMADA. All rights reserved.
//

import Foundation
import RealmSwift

protocol CascadeUpdatable {
    associatedtype KeyType
    var primaryKey: KeyType { get }
}

extension UserObject: CascadeUpdatable {
    typealias KeyType = Int
    var primaryKey: KeyType { get { return self.id } }
}


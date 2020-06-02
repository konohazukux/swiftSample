//
//  UserObject.swift
//  Sample1128
//
//  Created by koharu shimada on 2020/05/29.
//  Copyright © 2020 TAKESHI SHIMADA. All rights reserved.
//

import Foundation
import RealmSwift


protocol Keypathable {
    associatedtype ItemType
    associatedtype ObjectType: Object
    func primaryKeyPath() -> ReferenceWritableKeyPath<ObjectType, ItemType>
    func primaryKeys() -> ItemType
}


final class UserObject: Object {

    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var address: UserAdressObject?
    var items = List<UserItemObject>()
    
    override static func primaryKey() -> String? {
        return #keyPath(id)
    }
}

extension UserObject: Keypathable {
    typealias ItemType = Int
    typealias ObjectType = UserObject

    func primaryKeyPath() -> ReferenceWritableKeyPath<UserObject, Int> {
        return \UserObject.id
    }
    
    func primaryKeys() -> Int {
        return  self[keyPath: self.primaryKeyPath()]
    }

}


final class UserAdressObject: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var addressNum: String = ""
    @objc dynamic var address: String = ""
    
//    override static func primaryKey() -> String? {
//        return #keyPath(id)
//    }
}

final class UserItemObject: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    
//    override static func primaryKey() -> String? {
//        return #keyPath(id)
//    }
}






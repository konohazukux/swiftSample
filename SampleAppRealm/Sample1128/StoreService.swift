//
//  StoreService.swift
//  Sample1128
//
//  Created by koharu shimada on 2020/06/01.
//  Copyright © 2020 TAKESHI SHIMADA. All rights reserved.
//

import Foundation
import RealmSwift

protocol StoreServiceType: class {
    
}

class StoreService: StoreServiceType {
    
    func add<O: Object>(
        _ object: O,
        update: RealmSwift.Realm.UpdatePolicy = .modified
    ) throws -> O where O: Keypathable {
        do {
            let realm = try Realm()
            try realm.write {
                let key = object.primaryKeys()
                //fds
                if let obj = realm.object(ofType: O.self, forPrimaryKey: key) {
                    realm.delete(obj, cascading: true)
                }

                realm.add(object, update: .modified)
            }
            return object
        } catch {
            throw error
        }
        
    }

    func add<S: Sequence>(
        _ objects: S,
        update: RealmSwift.Realm.UpdatePolicy = .modified
    ) throws -> S where S.Iterator.Element: Object, S.Iterator.Element: Keypathable {
        do {
            let realm = try Realm()
            try realm.write {
                objects.forEach {
                    let key = $0.primaryKeys()
                    if let obj = realm.object(ofType: S.Iterator.Element.self, forPrimaryKey: key) {
                        realm.delete(obj, cascading: true)
                    }
                }
                realm.add(objects, update: update)
            }
            return objects
        }
        catch {
            throw error
        }
    }


    func fetch<O: Object, KeyType>(
      _ type: O.Type,
      forPrimaryKey primaryKey: KeyType
    ) throws -> O? {
      return try Realm().object(
        ofType: type,
        forPrimaryKey: primaryKey
      )
    }

    
}


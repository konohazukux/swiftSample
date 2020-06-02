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
    ) throws -> O where O: CascadeUpdatable {
        do {
            let realm = try Realm()
            try realm.write {
                if let obj = realm.object(ofType: O.self, forPrimaryKey: object.primaryKey) {
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
    ) throws -> S where S.Iterator.Element: Object {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(objects, update: update)
            }
            return objects
        }
        catch {
            throw error
        }
    }
    
    func add<S: Sequence>(
        _ objects: S,
        update: RealmSwift.Realm.UpdatePolicy = .modified
    ) throws -> S where S.Iterator.Element: Object, S.Iterator.Element: CascadeUpdatable {
        do {
            let realm = try Realm()
            try realm.write {
                objects.forEach {
                    if let obj = realm.object(ofType: S.Iterator.Element.self, forPrimaryKey: $0.primaryKey) {
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

    func fetch<O: Object>(
      _ type: O.Type,
      predicate: NSPredicate = NSPredicate(value: true)
    ) throws -> Results<O> {
      return try Realm().objects(type).filter(predicate)
    }

    
}


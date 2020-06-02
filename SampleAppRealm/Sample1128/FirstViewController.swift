//
//  FirstViewController.swift
//  Sample1128
//
//  Created by TAKESHI SHIMADA on 2019/11/28.
//  Copyright © 2019 TAKESHI SHIMADA. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SwiftDate
import RealmSwift
import Then

class FirstViewController: UIViewController {

    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.init(red: 0.9, green: 1, blue: 1, alpha: 1)
        
        addData()


    }
   
    func deleteData() {
        do {
            let realm = try Realm()
            
            if let user = realm.objects(UserObject.self).first {
                print("infolog:\(#line) \(type(of: self))  \(#function) : \(user) ")
                try realm.write {
                    realm.delete(user, cascading: true)
                }
            }
        } catch(let error) {
            print("error occured \(error)")
        }
        
    }
    
    func addData() {
      
        let realmPath = Realm.Configuration.defaultConfiguration.fileURL?.absoluteString ?? ""
        print("realmpath: \(realmPath)")

        let userAdressObject = UserAdressObject()
        userAdressObject.addressNum = "300-2348"
        userAdressObject.address = "ibaraki-ken"
        userAdressObject.id = 345

        let userObject = UserObject()
        userObject.id = 56
        userObject.name = "tanaka"
        userObject.address = userAdressObject
        userObject.items.append(objectsIn: [
            UserItemObject().then { $0.id = 1; $0.name = "knife" },
            UserItemObject().then { $0.id = 2; $0.name = "bowl" },
        ])

        let  userkey = userObject[keyPath: userObject.primaryKeyPath()]

      let users = [userObject]

       let aaa =  users.map { $0[keyPath: $0.primaryKeyPath() ] }
       print("infolog:\(#line) \(type(of: self))  \(#function) : \(aaa) ")
       print("infolog:\(#line) \(type(of: self))  \(#function) : -------------------------------- ")
        do {
            
            let storeService = StoreService()
            let _ = try storeService.add(users)
            
        } catch(let error) {
            print("error  \(error)")
        }
        
    }
   
    func temp() {

         let nameKeyPath = \Starship.name
         let warpKeyPath = \Starship.maxWarp
        
         print(voyager[keyPath: nameKeyPath])
         print(voyager[keyPath: warpKeyPath])

    }
    


}



struct Starship {
    var name: String
    var maxWarp: Double
}

let voyager = Starship(name: "Voyager", maxWarp: 9.975)



protocol Appendable {
    associatedtype Element
    var elements: [Element] { get }
    func append(element: Element)
}

class SomeAppendableClass<T> : Appendable {
    typealias Element = T
    var elements: [Element]
    
    init(elements: [Element]) {
        self.elements = elements
    }
    
    func append(element: Element) {
        elements.append(element)
    }
    
}



























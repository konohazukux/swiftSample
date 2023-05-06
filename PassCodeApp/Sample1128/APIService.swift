//
//  APIService.swift
//  Sample1128
//
//  Created by TAKESHI SHIMADA on 2023/04/20.
//  Copyright © 2023 TAKESHI SHIMADA. All rights reserved.
//

import Foundation
import Combine
import FirebaseFirestore

class APIService {
    func fetchUsers() -> AnyPublisher<[User], Error> {
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: [User].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }

    func storeDatabase(product: Product) {
        
        let db = Firestore.firestore()
        
        // Add a new document with a generated ID
        var ref: DocumentReference? = nil
        ref = db.collection("product").addDocument(data: [
            "id": product.id,
            "name": product.name,
            "code": product.code,
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
        
    }
    
    func retrieveData() {
        let db = Firestore.firestore()
        
        db.collection("users").getDocuments() { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                for document in querySnapshot!.documents {
                    let data = document.data()
                    let first = data["id"] as? String ?? ""
                    let last = data["last"] as? String ?? ""
                    let born = data["born"] as? Int ?? 0
                    print("sdf \(document.documentID) => \(first) \(last) \(born)")
                }
            }
        }
    }
}

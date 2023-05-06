//
//  ProductRepository.swift
//  Sample1128
//
//  Created by TAKESHI SHIMADA on 2023/05/06.
//  Copyright © 2023 TAKESHI SHIMADA. All rights reserved.
//

import FirebaseFirestore
import Combine

struct ProductRepository {
    private let productsPath = "products"
    private let db = Firestore.firestore()

    func createOrUpdateProduct(_ product: Product) -> AnyPublisher<Void, Error> {
        let documentPath: String
        if let id = product.id {
            documentPath = "\(productsPath)/\(id)"
        } else {
            documentPath = "\(productsPath)/\(db.collection(productsPath).document().documentID)"
        }

        return Future { promise in
            self.db.document(documentPath).setData([
                    "name": product.name,
                    "code": product.code,
            ]) { error in
                if let error = error {
                    promise(.failure(error))
                } else {
                    promise(.success(()))
                }
            }
        }.eraseToAnyPublisher()
    }

    func getProduct(id: String) -> AnyPublisher<Product, Error> {
        return Future { promise in
            self.db.collection(self.productsPath).document(id).getDocument { documentSnapshot, error in
                if let error = error {
                    promise(.failure(error))
                } else if let documentSnapshot = documentSnapshot,
                            let data = documentSnapshot.data() {
                    let product = Product(
                        id: documentSnapshot.documentID,
                        name: data["name"] as? String ?? "",
                        code: data["code"] as? String ?? ""
                    )
                    promise(.success(product))
                } else {
                    promise(.failure(NSError(domain: "ProductNotFoundError", code: -1, userInfo: nil)))
                }
            }
        }.eraseToAnyPublisher()
    }
    
    func getProducts() -> AnyPublisher<[Product], Error> {
        return Future { promise in
            self.db.collection(self.productsPath).getDocuments { querySnapshot, error in
                if let error = error {
                    promise(.failure(error))
                } else if let querySnapshot = querySnapshot {
                  let products =  querySnapshot.documents.map {
                      Product(
                            id: $0.documentID,
                            name: $0.data()["name"] as? String ?? "",
                            code: $0.data()["code"] as? String ?? ""
                        )
                    }
                    promise(.success(products))
                } else {
                    promise(.failure(NSError(domain: "ProductNotFoundError", code: -1, userInfo: nil)))
                }
            }
        }.eraseToAnyPublisher()
    }
    
}



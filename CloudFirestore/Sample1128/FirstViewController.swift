//
//  FirstViewController.swift
//  Sample1128
//
//  Created by TAKESHI SHIMADA on 2019/11/28.
//  Copyright © 2019 TAKESHI SHIMADA. All rights reserved.
//

import UIKit
import Combine
import FirebaseFirestore

class FirstViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var notificationButton: UIButton!
    private var myButton: UIButton!
    
    private var cancellable: AnyCancellable?

    deinit {
        // 適切なタイミングで購読を解除するために、キャンセルを呼び出す
        cancellable?.cancel()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        print("infolog: \(#line)  \(#function) :  \(#line) ") // swift lo
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print("infolog: \(#line)  \(#function) :  \(#line) ") // swift lo
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 1)
       
       storeDatabase()
        retrieveData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showContentView()
    }
    
    func showContentView() {
        let vc = ContentViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    func storeDatabase() {
        
        let db = Firestore.firestore()
        
        // Add a new document with a generated ID
        var ref: DocumentReference? = nil
        ref = db.collection("users").addDocument(data: [
            "first": "Ada",
            "last": "Lovelace",
            "born": 1815
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
                    let first = data["first"] as? String ?? ""
                    let last = data["last"] as? String ?? ""
                    let born = data["born"] as? Int ?? 0
                    print("sdf \(document.documentID) => \(first) \(last) \(born)")
                }
            }
        }
    }

}


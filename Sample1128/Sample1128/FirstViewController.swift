//
//  FirstViewController.swift
//  Sample1128
//

import UIKit
import RxSwift
import RxCocoa

class FirstViewController: UIViewController {

    let disposeBag = DisposeBag()
    @IBOutlet var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        transition(urlSchema: "plato://temp-temp/test")

    }
   
    func transition(urlSchema: String) {
        let url = URL(string: urlSchema)
        if let url = url, let host = url.host {
            print(host)
        }
    }

}


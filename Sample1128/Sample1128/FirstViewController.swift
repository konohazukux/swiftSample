//
//  FirstViewController.swift
//  Sample1128
//

import UIKit
import RxSwift
import RxCocoa

class FirstViewController: UIViewController {

    @IBOutlet var button: UIButton!

    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        temp()
    }
   
    func temp() {
       
        let vc = MissionViewController()
//        let vc = MissionSelectViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
        
    }
   
}


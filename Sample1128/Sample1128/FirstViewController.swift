//
//  FirstViewController.swift
//  Sample1128
//

import UIKit
import RxSwift
import RxCocoa
import PAYJP

class FirstViewController: UIViewController {

    let disposeBag = DisposeBag()
    @IBOutlet var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc = EditAddressViewController()
        let nv = UINavigationController()
        nv.viewControllers = [vc]
        nv.modalPresentationStyle = .fullScreen
        present(nv, animated: true, completion: nil)
    }
    

}


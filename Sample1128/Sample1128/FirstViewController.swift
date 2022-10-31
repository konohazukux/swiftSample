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
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            guard let self = self else { return }
            self.temp()
        }
    }
   
    func temp() {

        let someVC = SomeViewController()
        let vc = HalfModalContainerViewController()
        
        if let tab = tabBarController {
            vc.addPanel(toParent: tab)
            vc.set(someVC)
            vc.show()
        }
    }
   
}


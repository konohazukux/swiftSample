//
//  FirstViewController.swift
//  Sample1128
//

import UIKit
import PKHUD
import RxSwift
import RxRelay

class FirstViewController: UIViewController {

    let disposeBag = DisposeBag()
    lazy var indicator = HUDService().bindHUD(disposeBag: disposeBag)
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.rx.tap
            .trackActivity(indicator)
            .subscribe()
            .disposed(by: disposeBag)

    }
}

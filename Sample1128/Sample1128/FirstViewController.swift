//
//  FirstViewController.swift
//  Sample1128
//

import UIKit
import PKHUD
import RxSwift
import RxRelay

class FirstViewController: UIViewController, IndicatorPresentable {

    let indicator = ActivityIndicator()
    let disposeBag = DisposeBag()
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setIndicator()
        
        button.rx.tap
            .trackActivity(indicator)
            .subscribe()
            .disposed(by: disposeBag)

    }
}

protocol IndicatorPresentable: AnyObject {
    var disposeBag: DisposeBag { get }
    var indicator: ActivityIndicator { get }
    func setIndicator()
}

extension IndicatorPresentable {
    func setIndicator() {
        indicator.asObservable()
            .bind(to: HUDService.shared.isLoadActive)
            .disposed(by: disposeBag)
    }
}

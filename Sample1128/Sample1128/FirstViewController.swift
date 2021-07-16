//
//  FirstViewController.swift
//  Sample1128
//
//  Created by TAKESHI SHIMADA on 2019/11/28.
//  Copyright © 2019 TAKESHI SHIMADA. All rights reserved.
//

import UIKit
import SafariServices
import RxSwift
import RxCocoa
import SwiftDate

struct User: Codable {
    var name: String
}

var testCount = 0

class FirstViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var phoneTf: UITextField!
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    private var myButton: UIButton!
    let disposeBag = DisposeBag()
    let testRelay = PublishRelay<Int>()

    let viewModel = FirstViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().layer.borderWidth = 0.5
        UITabBar.appearance().layer.borderColor = UIColor.clear.cgColor
        UITabBar.appearance().clipsToBounds = true


    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
       
        temp()
       
//        viewModel.eventGeusture(state: .began, positionY: 140)
//        viewModel.eventGeusture(state: .changed, positionY: 135)
//        viewModel.eventGeusture(state: .changed, positionY: 130)
//        viewModel.eventGeusture(state: .changed, positionY: 125)
//        viewModel.eventGeusture(state: .changed, positionY: 120)
//        viewModel.eventGeusture(state: .changed, positionY: 110)
//        viewModel.eventGeusture(state: .changed, positionY: 112)
//        viewModel.eventGeusture(state: .changed, positionY: 115)
//        viewModel.eventGeusture(state: .ended, positionY: 118)
//
//
//        viewModel.eventGeusture(state: .began, positionY: 40)
//        viewModel.eventGeusture(state: .ended, positionY: 35)
        
        
    }
    
    func temp() {
        
        viewModel.pergentageRelay
            .asDriver()
            .drive(onNext: { [unowned self] val in
                let height = (100.0 - val)
                self.heightConstraint.constant = height
            })
            .disposed(by: disposeBag)
        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: nil)
        panGestureRecognizer.rx.event
            .subscribe(onNext: { [weak self] sender in
                guard let self = self else { return }
                let currentPointY = sender.location(in: self.view).y
                switch sender.state {
                case .began:
                    self.viewModel.eventGeusture(state: .began, positionY: currentPointY)
                case .changed:
                    self.viewModel.eventGeusture(state: .changed, positionY: currentPointY)
                case .ended:
                    self.viewModel.eventGeusture(state: .ended, positionY: currentPointY)
                default:
                    break
                }
            })
            .disposed(by: disposeBag)
        view.addGestureRecognizer(panGestureRecognizer)

    }
    
    private func showSetting() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak self] in
            let sb = UIStoryboard.init(name: "SettingViewController", bundle: nil)
            if let vc = sb.instantiateInitialViewController() as? SettingViewController {
                self?.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
}

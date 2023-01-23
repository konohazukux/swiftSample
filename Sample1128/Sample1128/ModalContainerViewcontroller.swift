//
//  ModalContainerViewcontroller.swift
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

class ModalContainerViewController: UIViewController {
  
    @IBOutlet private var stackView: UIStackView!
    @IBOutlet private var topConstraint: NSLayoutConstraint?
    @IBOutlet private var controlView: UIControl!
   
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        controlView.rx.controlEvent(.touchUpInside)
            .asDriver()
            .drive(onNext: { [weak self]  _ in
                self?.hide()
            })
            .disposed(by: disposeBag)
                
        // 下スワイプ
        let downSwipe = UISwipeGestureRecognizer(
            target: self,
            action: #selector(ModalContainerViewController.didSwipe(_:))
        )
        downSwipe.direction = .down
        self.view.addGestureRecognizer(downSwipe)
    }
   
    func addPanel(toParent parent: UIViewController) {
        modalPresentationStyle = .overCurrentContext
        parent.present(self, animated: false)
    }
    
    func set(_ vc: UIViewController) {
        addChild(vc)
        stackView.addArrangedSubview(vc.view)
        self.loadViewIfNeeded()
    }
    
    func show() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak self] in
            guard let self = self else { return }
            UIView.animate(
                withDuration: 0.2,
                animations: {
                    self.topConstraint?.isActive = false
                    self.view.layoutIfNeeded()
                }, completion: nil)
        }
    }

    func hide() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak self] in
            guard let self = self else { return }
            UIView.animate(
                withDuration: 0.2,
                animations: {
                    self.topConstraint?.isActive = true
                    self.view.layoutIfNeeded()
                }, completion: { _ in
                    self.dismiss(animated: false)
                })
        }
    }
    
    @objc func didSwipe(_ sender: UISwipeGestureRecognizer) {
        switch sender.direction {
        case .down:
            hide()
        default:
            break
        }
    }
}

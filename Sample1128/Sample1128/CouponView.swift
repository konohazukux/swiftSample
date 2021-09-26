//
//  CouponSaleView.swift
//  Sample1128
//

import UIKit
import RxSwift
import RxCocoa

class CouponView: UIView {

    @IBOutlet private weak var button: UIButton!
    @IBOutlet private weak var purchaseButton: UIButton!
    @IBOutlet private weak var stackView: UIStackView!
    @IBOutlet private weak var discriptionView: UIView!
   
    var purchaseAction: (() -> Void)?
    private let disposeBag = DisposeBag()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        instantiateView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func instantiateView() {
        let classNameString = String(describing: type(of: self))
        let nib = UINib(nibName: classNameString, bundle: .main)
        let rootView = nib.instantiate(withOwner: self).first as! UIView
        rootView.translatesAutoresizingMaskIntoConstraints = false
        rootView.addToView(parant: self)
//        bind()
    }
    
//    private func bind() {
//        button.rx.tap
//            .asDriver()
//            .drive(onNext: { [unowned self] in
//                let bln = self.discriptionView.isHidden
//                self.discriptionView.isHidden = !bln
//            })
//            .disposed(by: disposeBag)
//        purchaseButton.rx.tap
//            .asDriver()
//            .drive(onNext: { [unowned self] in
//                self.purchaseAction?()
//            })
//            .disposed(by: disposeBag)
//
//    }

}

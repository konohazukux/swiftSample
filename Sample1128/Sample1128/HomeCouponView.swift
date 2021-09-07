//
//  NoticeView.swift
//  Sample1128
//
//  Created by TAKESHI SHIMADA on 2021/09/03.
//  Copyright © 2021 TAKESHI SHIMADA. All rights reserved.
//

import UIKit
import RxSwift
import RxGesture

protocol BaseModel: Equatable & Codable {
}

protocol ViewUsable {
    func setupView()
}
extension ViewUsable where Self: UIView {
    func instantiateView() {
        let classNameString = String(describing: type(of: self))
        let nib = UINib(nibName: classNameString, bundle: .main)
        let rootView = nib.instantiate(withOwner: self).first as! UIView
        rootView.frame = self.bounds
        self.addSubview(rootView)
        
        setupView()
    }
}

class HomeCouponView: UIView, ViewUsable {
    private let disposeBag = DisposeBag()

    struct TopCouponModel: BaseModel {
        var couponNum: Int
    }

    @IBOutlet private weak var helpImageView: UIImageView!
    @IBOutlet private weak var couponNumLabel: UILabel!
   
    private var model: TopCouponModel!
    
    convenience init(model: TopCouponModel) {
        self.init(frame: .zero)
        self.model = model
        instantiateView()
    }

//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        instantiateView()
//    }
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//    }

    func setupView() {
        bind()
        couponNumLabel.text = String(model.couponNum)
    }
    
    func bind() {
        rx.tapGesture()
            .when(.recognized)
            .asDriver(onErrorDriveWith: .never())
            .drive(onNext: {
                print("111 sdfinfolog-\(#line) \(type(of: self))  \(#function) : \($0) ")
            })
            .disposed(by: disposeBag)
       
        helpImageView.rx.tapGesture()
            .when(.recognized)
            .asDriver(onErrorDriveWith: .never())
            .drive(onNext: {
                print("111 sdfinfolog-\(#line) \(type(of: self))  \(#function) : \($0) ")
            })
            .disposed(by: disposeBag)
    }
}

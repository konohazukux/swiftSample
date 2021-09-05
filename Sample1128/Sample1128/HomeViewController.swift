//
//  Top2ViewController.swift
//  Sample1128
//
//  Created by TAKESHI SHIMADA on 2021/09/03.
//  Copyright © 2021 TAKESHI SHIMADA. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import RxGesture

class HomeViewController: UIViewController {
  
    @IBOutlet var topCouponView: TopCouponView!
    @IBOutlet var couponStackView: UIStackView!
    @IBOutlet var noticeStackView: UIStackView!
    
    private let disposeBag = DisposeBag()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        fatalError("init(coder:) has not been implemented")
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.setCouponView()
            self?.setNoticeView()
        }
    }
 
    private func setCouponView() {
        couponStackView.arrangedSubviews.forEach {
            couponStackView.removeArrangedSubview($0)
        }
       
        let view = TopCouponView(model: .init(couponNum: 4))
        couponStackView.addArrangedSubview(view)
    }

    private func setNoticeView() {
        
        noticeStackView.arrangedSubviews.forEach {
            noticeStackView.removeArrangedSubview($0)
        }
       
        let view = TopNoticeView(
            model: .init(
                dateStr: "456789",
                notice: "notice12345"
            )
        )
        noticeStackView.addArrangedSubview(view)
    }

    

}

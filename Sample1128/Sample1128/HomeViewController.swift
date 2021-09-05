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
  
    @IBOutlet var topHeaderView: UIView!
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
      
        DispatchQueue.main.asyncAfter(deadline: .now() + 0) { [weak self] in
            self?.setTopHeaderView()
            self?.setCouponView()
            self?.setNoticeView()
        }
    }

    private func setTopHeaderView() {
        let view = TopHeaderView()
        view.addToView(parant: topHeaderView)
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
       
        let view1 = TopNoticeView(
            model: .init(
                id: 1,
                dateStr: "456789",
                notice: "notice12345"
            ),
            delegate: self
        )
        let view2 = TopNoticeView(
            model: .init(
                id: 2,
                dateStr: "456789",
                notice: "notice2"
            ),
            delegate: self
        )
        noticeStackView.addArrangedSubview(view1)
        noticeStackView.addArrangedSubview(view2)
    }

}

extension HomeViewController: TopNoticeViewDelegate {
    func didTap(id: Int) {
        print("111 sdfinfolog-\(#line) \(type(of: self))  \(#function) :  notice did tap \(id)")
    }
}

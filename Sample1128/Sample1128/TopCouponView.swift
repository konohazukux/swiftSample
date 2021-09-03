//
//  NoticeView.swift
//  Sample1128
//
//  Created by TAKESHI SHIMADA on 2021/09/03.
//  Copyright © 2021 TAKESHI SHIMADA. All rights reserved.
//

import UIKit
import RxSwift

protocol ViewUsable {}
extension ViewUsable where Self: UIView {
    func instantiateView() {
        let classNameString = String(describing: type(of: self))
        let nib = UINib(nibName: classNameString, bundle: .main)
        let rootView = nib.instantiate(withOwner: self).first as! UIView
        rootView.frame = self.bounds
        self.addSubview(rootView)
    }
}


class TopCouponView: UIView, ViewUsable {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        instantiateView()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        instantiateView()
    }
}

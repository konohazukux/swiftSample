//
//  TopNoticeView.swift
//  Sample1128
//
//  Created by TAKESHI SHIMADA on 2021/09/03.
//  Copyright © 2021 TAKESHI SHIMADA. All rights reserved.
//

import UIKit
import RxSwift

class TopHeaderView: UIView, ViewUsable {

    private let disposeBag = DisposeBag()

    convenience init() {
        self.init(frame: .zero)
        instantiateView()
    }

    func setupView() {
        bind()
    }
    
    func bind() {
    }
    
    
}

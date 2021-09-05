//
//  TopNoticeView.swift
//  Sample1128
//
//  Created by TAKESHI SHIMADA on 2021/09/03.
//  Copyright © 2021 TAKESHI SHIMADA. All rights reserved.
//

import UIKit
import RxSwift

class TopNoticeView: UIView, ViewUsable {

    struct TopNoticeModel: BaseModel {
        var dateStr: String
        var notice: String
    }

    private let disposeBag = DisposeBag()
    @IBOutlet private var dateLabel: UILabel!
    @IBOutlet private var noticeStrLabel: UILabel!
    @IBOutlet private var inpotantImageView: UIImageView!
    private var model: TopNoticeModel!

    convenience init(model: TopNoticeModel) {
        self.init(frame: .zero)
        self.model = model
        instantiateView()
    }

    func setupView() {
        bind()
        dateLabel.text = model.dateStr
        noticeStrLabel.text = model.notice
    }
    
    func bind() {
        rx.tapGesture()
            .when(.recognized)
            .asDriver(onErrorDriveWith: .never())
            .drive(onNext: {
                print("111 sdfinfolog-\(#line) \(type(of: self))  \(#function) : \($0) ")
            })
            .disposed(by: disposeBag)
    }
}

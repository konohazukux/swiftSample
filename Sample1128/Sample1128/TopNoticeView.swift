//
//  TopNoticeView.swift
//  Sample1128
//
//  Created by TAKESHI SHIMADA on 2021/09/03.
//  Copyright © 2021 TAKESHI SHIMADA. All rights reserved.
//

import UIKit
import RxSwift

protocol TopNoticeViewDelegate: AnyObject {
    func didTap(id: Int)
}

class TopNoticeView: UIView, ViewUsable {

    struct TopNoticeModel: BaseModel {
        var id: Int
        var dateStr: String
        var notice: String
    }

    private let disposeBag = DisposeBag()
    @IBOutlet private var dateLabel: UILabel!
    @IBOutlet private var noticeStrLabel: UILabel!
    @IBOutlet private var inpotantImageView: UIImageView!
    private var model: TopNoticeModel!
    private weak var delegate: TopNoticeViewDelegate?

    convenience init(model: TopNoticeModel, delegate: TopNoticeViewDelegate) {
        self.init(frame: .zero)
        self.model = model
        self.delegate = delegate
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
            .drive(onNext: { [unowned self] _ in
                self.delegate?.didTap(id: self.model.id)
            })
            .disposed(by: disposeBag)
    }
}

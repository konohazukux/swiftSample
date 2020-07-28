//
//  PointHistoryView.swift
//  Sample1128
//
//  Created by t shimada on 2020/07/27.
//  Copyright © 2020 TAKESHI SHIMADA. All rights reserved.
//

import Foundation
import UIKit

class PointCardView: UIView, NibLoaderProtocol  {

    @IBOutlet private weak var stackView: UIStackView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        _loadNib()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        _loadNib()
    }
    func _loadNib() {
        addNibWithLayout()
        temp()
    }

    func temp() {
       
         // カード紐付け AN01AU11_TSPay紐付照会
        let tspayLinks  = GetTspayLinks.init(
             b01: nil,
             b02: [
             .init(crdBrndCd: nil, crdBrndName: nil, crdCoCd: nil, crdKainNo4f: "9366", crdKnrNo: nil, crdName: "TOYOTA TS CUBIC CARD JCB レギュラー", crdShrCd: nil, crdShrName: nil, crdTkCoCd1: nil, crdTkCoCd2: nil, crdTkHshCd: nil),
             .init(crdBrndCd: nil, crdBrndName: nil, crdCoCd: nil, crdKainNo4f: "9367", crdKnrNo: nil, crdName: "TOYOTA TS CUBIC CARD JCB レギュラー", crdShrCd: nil, crdShrName: nil, crdTkCoCd1: nil, crdTkCoCd2: nil, crdTkHshCd: nil),
             .init(crdBrndCd: nil, crdBrndName: nil, crdCoCd: nil, crdKainNo4f: "9368", crdKnrNo: nil, crdName: "TOYOTA TS CUBIC CARD JCB レギュラー", crdShrCd: nil, crdShrName: nil, crdTkCoCd1: nil, crdTkCoCd2: nil, crdTkHshCd: nil),
             ],
             message: nil,
             result: nil
         )
        
        (tspayLinks.b02 ?? []).forEach {
            let item = PointCardItemView()
            item.setData(data: $0)
            stackView.addArrangedSubview(item)
        }


    }

}

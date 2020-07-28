//
//  PointHistoryView.swift
//  Sample1128
//
//  Created by t shimada on 2020/07/27.
//  Copyright © 2020 TAKESHI SHIMADA. All rights reserved.
//

import Foundation
import UIKit

class PointHistoryView: UIView, NibLoaderProtocol  {

    @IBOutlet private weak var stackView: UIStackView!
    @IBOutlet private weak var titleLabel: UILabel!

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

        setData()
    }
    
    func setData() {
        let data = readData()
      
        titleLabel.text = data.nengetu.map { val -> String in
            "ポイント照会（\(val.prefix(4))年\(val.suffix(2))月）"
        }
        
        // items
        (data.ptRirekiUchiwake ?? []).forEach {
            let item = PointHistoryItemView(model: $0)
            item.topBoarderView.isHidden = stackView.arrangedSubviews.count == 0
            stackView.addArrangedSubview(item)
        }

        
    }
    
    func readData() -> GetMallPointHistory {
      return GetMallPointHistory.init(
            kensu: nil,
            message: nil,
            nengetu: "202101",
            ptRirekiUchiwake: [
                .init(cancelKanoFlg: nil, daihyoKmtName: nil, fuyoRiyu: "ポイント商品交換/商品", jiyuCd: "08", jiyuDetCd: nil, pt: 53738, torihikiBi: "20200912", torihikiType: "取消済", uriageNo: nil),
                .init(cancelKanoFlg: nil, daihyoKmtName: nil, fuyoRiyu: "ポイント商品交換/商品2", jiyuCd: "01", jiyuDetCd: nil, pt: 4567, torihikiBi: "20190312", torihikiType: "利用取消", uriageNo: nil),
                .init(cancelKanoFlg: nil, daihyoKmtName: nil, fuyoRiyu: "ポイント商品交換/商品2", jiyuCd: "40", jiyuDetCd: nil, pt: 4567, torihikiBi: "20190312", torihikiType: "失効", uriageNo: nil)
            ],
            result: nil)
    }

}

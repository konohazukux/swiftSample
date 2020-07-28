//
//  PointHistoryItemView.swift
//  Sample1128
//
//  Created by t shimada on 2020/07/27.
//  Copyright © 2020 TAKESHI SHIMADA. All rights reserved.
//

import Foundation
import UIKit

typealias PointHistoryItemModel = GetMallPointHistory.PtRirekiUchiwake

class PointHistoryItemView: UIView, NibLoaderProtocol {
   
    @IBOutlet weak var topBoarderView: UIView!
    /// C-2 付与理由
    @IBOutlet private weak var fuyoRiyuLabel: UILabel!
    /// C-3 取引日付
    @IBOutlet private weak var torihikiBiLabel: UILabel!
    /// C-4 取引種類
    @IBOutlet private weak var torihikiTypeLabel: UILabel!
    /// C-5 ポイント
    @IBOutlet private weak var pointLabel: UILabel!

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(model: PointHistoryItemModel) {
        super.init(frame: .zero)
        
        addNibWithLayout()

        fuyoRiyuLabel.text = model.fuyoRiyu
        torihikiBiLabel.text = model.torihikiBiString
        torihikiTypeLabel.text = model.torihikiType
        torihikiTypeLabel.textColor = model.signColor
        pointLabel.text = model.pointString
        pointLabel.textColor = model.signColor
       
        // 失効の場合は全部青文字
        if model.isPointExpire {
            [fuyoRiyuLabel, torihikiBiLabel, torihikiTypeLabel, pointLabel].forEach { $0?.textColor = .blue }
        }
    }
    
}

extension PointHistoryItemModel {
    /// C-3 取引日付
    var torihikiBiString: String? {
        let c = Array(torihikiBi ?? "")
        guard c.count == 8 else { return nil }
        return "\(c[2])\(c[3])/\(c[4])\(c[5])/\(c[6])\(c[7])"
    }
    /// C-4    取引種類
    var signColor: UIColor {
        isMinusPoint ? .lightGray : .black
    }
    /// C-5 ポイント
    var pointString: String? {
        pt.map { (isMinusSign ? "-" : "" ) + String($0).currencyInputFormatting() }
    }
    private var isMinusSign: Bool {
        isMinusPoint || isPointExpire
    }
    private var isMinusPoint: Bool {
        switch jiyuCd {
        case "08", "10", "41": return true
        default: return false
        }
    }
    var isPointExpire: Bool {
        jiyuCd == "40"
    }
}

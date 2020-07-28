//
//  PointCardItemView.swift
//  Sample1128
//
//  Created by t shimada on 2020/07/27.
//  Copyright © 2020 TAKESHI SHIMADA. All rights reserved.
//

import Foundation
import UIKit

class PointCardItemView: UIView, NibLoaderProtocol  {

    @IBOutlet private weak var cardLabel: UILabel!

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
    }

    func setData(data: GetTspayLinks.B02) {
        let crdBrndName = data.crdName ?? ""
        let crdKainNo4f = data.crdKainNo4f ?? ""
        cardLabel.text = crdBrndName + "\n" + "（カード番号下４桁: " + crdKainNo4f + ")"
    }

}

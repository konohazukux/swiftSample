//
//  PointCardItemView.swift
//  Sample1128
//
//  Created by t shimada on 2020/07/27.
//  Copyright © 2020 TAKESHI SHIMADA. All rights reserved.
//

import Foundation
import UIKit

class PointCardItemView: UIView {

    @IBOutlet private weak var cardLabel: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        loadNib()
    }

    func loadNib() {
        if let view = Bundle(for: type(of: self)).loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)?.first as? UIView {
            self.addSubview(view)
            view.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            view.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
            view.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
            view.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        }
    }
    
    func setData(data: GetTspayLinks.B02) {
        let crdBrndName = data.crdName ?? ""
        let crdKainNo4f = data.crdKainNo4f ?? ""
        cardLabel.text = crdBrndName + "\n" + "（カード番号下４桁: " + crdKainNo4f + ")"
    }

}

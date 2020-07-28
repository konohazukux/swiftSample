//
//  PointSelectPeriodView.swift
//  Sample1128
//
//  Created by t shimada on 2020/07/27.
//  Copyright © 2020 TAKESHI SHIMADA. All rights reserved.
//

import Foundation
import UIKit

class PointSelectPeriodView: UIView, NibLoaderProtocol  {

    @IBOutlet private weak var periodView: UIView!
    @IBOutlet private weak var doneButton: UIView!

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
        setupUI()
    }

    func setupUI() {
        periodView.corner(radius: 8.0)
        periodView.border(width: 1.0, color: .lightGray)
        doneButton.corner(radius: 6.0)
    }

}

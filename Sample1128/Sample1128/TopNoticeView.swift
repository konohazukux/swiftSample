//
//  TopNoticeView.swift
//  Sample1128
//
//  Created by TAKESHI SHIMADA on 2021/09/03.
//  Copyright © 2021 TAKESHI SHIMADA. All rights reserved.
//

import UIKit

class TopNoticeView: UIView, ViewUsable {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        instantiateView()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        instantiateView()
    }
}

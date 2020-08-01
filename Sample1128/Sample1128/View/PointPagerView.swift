//
//  PointPagerView.swift
//  Sample1128
//
//  Created by t shimada on 2020/07/27.
//  Copyright © 2020 TAKESHI SHIMADA. All rights reserved.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

class PointPagerView: UIView, NibLoaderProtocol  {

    @IBOutlet private weak var stackView: UIStackView!
    
    @IBOutlet private weak var movePageContainerView: UIView!
    @IBOutlet private var numberViews: [UIView] = []

    override init(frame: CGRect) {
        super.init(frame: frame)
        addNibWithLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        addNibWithLayout()
       
        setupUI()
        setData(startNum: 8, selectedNum: 13, maxNum: 98)
    }
    
    func setupUI() {
        numberViews.forEach { $0.subviews.forEach { $0.cornerRadius = 4.0 }}
        movePageContainerView.isHidden = true
    }

    func setData(startNum: Int, selectedNum: Int, maxNum: Int) {
        let sorted = numberViews
            .sorted(by: { $0.frame.minX < $1.frame.minX  })
      
        let calsNum = { (index: Int) -> Int in
            index + startNum
        }
        
        for (index, view) in sorted.enumerated() {
            let num = calsNum(index)
            view.isHidden = num > maxNum
            view.subviews.filter { $0.isKind(of: UILabel.self) }
                .compactMap { $0 as? UILabel }
                .forEach {
                    $0.text = String(num)
                    $0.textColor = num == selectedNum ? .white : .red
                }
            view.subviews.first(where: { $0.tag == 1002 })?.isHidden = (num == selectedNum)
            view.subviews.first(where: { $0.tag == 1001 })?.isHidden = (num != selectedNum)
        }
    }
    
}

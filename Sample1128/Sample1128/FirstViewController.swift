//
//  FirstViewController.swift
//  Sample1128
//
//  Created by TAKESHI SHIMADA on 2019/11/28.
//  Copyright © 2019 TAKESHI SHIMADA. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import RxRelay

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    
}


@IBDesignable
class DotLineView: UIView {
    // Inspectorで点線の色と幅を設定出来るようにする
    @IBInspectable var dotColor: UIColor = UIColor.gray
    @IBInspectable var lineWidth: CGFloat = 2.0
    @IBInspectable var dashWidth: CGFloat = 2.0

    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        path.lineWidth = self.lineWidth
        path.lineCapStyle = .butt
        path.move(to: CGPoint(x: 0, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.width, y: rect.midY))
        let dashes = [dashWidth, dashWidth]
        path.setLineDash(dashes, count: dashes.count, phase: 0)
        dotColor.setStroke()
        path.stroke()
    }
}

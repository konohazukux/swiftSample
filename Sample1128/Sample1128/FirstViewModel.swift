//
//  FirstViewModel.swift
//  Sample1128
//
//  Created by TAKESHI SHIMADA on 2021/07/16.
//  Copyright © 2021 TAKESHI SHIMADA. All rights reserved.
//

import Foundation
import RxSwift
import RxRelay

class FirstViewModel {

    private lazy var navigationBarHeightWhenShrunked: CGFloat = {
        48 / 2.0
    }()

    enum GestureState {
        case began
        case changed
        case ended
        case none
    }

    var startPanPointY: CGFloat = 0.0
    var previosPoint: CGFloat? = nil
    //var percentage = BehaviorRelay<CGFloat>(value: 0.0)
    var barUpHeight: CGFloat = 0.0
    var pergentageRelay = BehaviorRelay<CGFloat>.init(value: 100.0)
    
    
    func bind() {
        
    }
    
    func eventGeusture(state: GestureState, positionY currentPointY: CGFloat) {
        switch state {
        case .began:
            print("begin")
            previosPoint = nil
            startPanPointY = currentPointY
        case .changed:
            print("changed")
            let diff = currentPointY - startPanPointY
            print("diff \(diff)")
        case .ended:
            print("ended")
            let diff = currentPointY - startPanPointY
            print("diff \(diff)")
        default:
            print("default")
            previosPoint = nil
        }
        
        defer {
            print("111 sdfinfolog-\(#line) \(type(of: self))  \(#function) : \(self) ")
            previosPoint = currentPointY
        }
     
        guard let previosPoint = previosPoint else { return }
        let diff = currentPointY - previosPoint

        let _barUpHeight = barUpHeight - diff
        barUpHeight = min(max(0, _barUpHeight), navigationBarHeightWhenShrunked)
        let percentage = barUpHeight / navigationBarHeightWhenShrunked
        let perInt = Int(percentage * 100)
        print("112 sdfinfolog-\(#line) \(type(of: self))  \(#function) : \(barUpHeight) \(diff) \(perInt)")
       
        pergentageRelay.accept(CGFloat(perInt))
        
    }
    
    
    
}

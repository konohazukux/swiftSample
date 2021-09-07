//
//  TopNoticeView.swift
//  Sample1128
//
//  Created by TAKESHI SHIMADA on 2021/09/03.
//  Copyright © 2021 TAKESHI SHIMADA. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import RxRelay


class HomeHeaderView: UIView, ViewUsable {

    @IBOutlet weak var pieChartView: UIView!
    
    private let disposeBag = DisposeBag()
    private var tempDisposable: Disposable?

    convenience init() {
        self.init(frame: .zero)
        instantiateView()
    }

    func setupView() {
        bind()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.count()
        }


    }
    
    func bind() {
    }
    
    func count() {

        let temp = [1, 2, 4]
        Observable
            .from(temp)
            .asObservable()
            .subscribe(onNext: { val in
                print(val)
            })
            .disposed(by: disposeBag)

        let fromPer = 50.0
        let toPer = 80.0
        let duration = 1.0
        let div = 100.0
        let unit = (toPer - fromPer) / div
        var progressPer = fromPer
        let millisecondesInterval = Int(1000 * duration / div)

        let disposable = Observable<Int>
            .interval(.milliseconds(millisecondesInterval), scheduler: MainScheduler.instance)
            .subscribe(onNext: { [weak self] val in
                guard let self = self else { return }
                progressPer += unit
                print(progressPer)
                if progressPer > toPer {
                    self.tempDisposable?.dispose()
                } else {
                    self.updateCircleLayer(view: self.pieChartView, from: 0, to: progressPer)
                }
            })
       
        disposeBag.insert(disposable)
        self.tempDisposable = disposable
    }

    private func updateCircleLayer(
        view: UIView,
        lineWith: CGFloat = 10.0,
        fillColor: UIColor = .clear,
        boarderColor: UIColor = .init(red: 255/255, green: 230/255, blue: 0/255, alpha: 1),
        from: Double = 0.0,
        to: Double = 0.0
    ) {
        
        let  _layer = { () -> CAShapeLayer in
            if let layer = view.layer.sublayers?.first(where: { $0.name == "circleLayer" }) as? CAShapeLayer {
                return layer
            }
            let layer = CAShapeLayer()
            layer.fillColor = fillColor.cgColor
            layer.strokeColor = boarderColor.cgColor
            layer.lineWidth = lineWith
            layer.name = "circleLayer"
            view.layer.addSublayer(layer)
            return layer
        }()

        let convertToAngle = { CGFloat(Double.pi * ((($0 / 100) * 2) - 0.5)) }
        let arcCenter = CGPoint(x: view.frame.width/2, y: view.frame.height/2)
        let radius = view.frame.width/2 - lineWith / 2
        let path = UIBezierPath(arcCenter: arcCenter,
                                radius: radius,
                                startAngle: convertToAngle(from),
                                endAngle: convertToAngle(to),
                                clockwise: true)
        path.lineCapStyle = .round
        _layer.path = path.cgPath
       
        /*
        let animation = CAKeyframeAnimation(keyPath: "strokeEnd")
        animation.values = [0.0, 1.0, 1.0]
        animation.keyTimes = [0.0, 0.3, 1.0]
        animation.duration = 3.0
        animation.repeatCount = .greatestFiniteMagnitude
        _layer.add(animation, forKey: nil)
        */
        
    }

}

//    private func createCircleLayer(
//        view: UIView,
//        lineWith: CGFloat = 0.0,
//        fillColor: UIColor = .clear,
//        boarderColor: UIColor = .black
//    ) -> CAShapeLayer {
//        let _layer = CAShapeLayer()
//        _layer.fillColor = UIColor.init(red: 255/255, green: 230/255, blue: 0/255, alpha: 1).cgColor
//        _layer.strokeColor = boarderColor.cgColor
//        _layer.lineWidth = lineWith
//        _layer.name = "circleBackground"
//
//        let arcCenter = CGPoint(x: view.frame.width/2, y: view.frame.height/2)
//        let radius = view.frame.width/2 - lineWith / 2
//        let path = UIBezierPath(arcCenter: arcCenter,
//                                radius: radius,
//                                startAngle: CGFloat(Double.pi * -0.5),
//                                endAngle: CGFloat(Double.pi * 0.5),
//                                clockwise: true)
//        path.lineCapStyle = .round
//        _layer.path = path.cgPath
//        return _layer
//    }


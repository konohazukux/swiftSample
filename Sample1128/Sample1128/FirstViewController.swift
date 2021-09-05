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

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var phoneTf: UITextField!
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var circleView: UIView!
    
    var per = Double(0.0)
    
    private var tmpDisposable: Disposable?

    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        let controller = HomeViewController()
//        navigationController?.pushViewController(controller, animated: true)

//       let circleLayer = createCircleLayer(view: circleView)
//        circleView.layer.addSublayer(circleLayer)

        let temp = (Array<Int>)(0..<5)


//        Observable
//            .from(temp)
//            .asObservable()
//
//            .subscribe(onNext: { val in
//                print(val)
//            })
//            .disposed(by: disposeBag)

//        updateView()
        count()
//        DispatchQueue.main.asyncAfter(deadline: .now() + 10) { [weak self] in
//            self?.tmpDisposable?.dispose()
//        }
    }
    
    func count() {

        var total = 0
        
        let disposable = Observable<Int>
            .interval(.milliseconds(1), scheduler: MainScheduler.instance)
            .subscribe(onNext: { [weak self] val in
                total += 1
                print(total)
                
                if total > 5000 {
                    self?.tmpDisposable?.dispose()
                }
            })
       
        disposeBag.insert(disposable)
        self.tmpDisposable = disposable
    }
    
    func updateView() {
        self.updateCircleLayer(view: self.circleView, from: 0, to: per)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) { [weak self] in
            self?.updateView()
            self?.per += 1
        }
       


        


    }

    private func createCircleLayer(
        view: UIView,
        lineWith: CGFloat = 0.0,
        fillColor: UIColor = .clear,
        boarderColor: UIColor = .black
    ) -> CAShapeLayer {
        let _layer = CAShapeLayer()
        _layer.fillColor = UIColor.init(red: 255/255, green: 230/255, blue: 0/255, alpha: 1).cgColor
        _layer.strokeColor = boarderColor.cgColor
        _layer.lineWidth = lineWith
        _layer.name = "circleBackground"
        
        let arcCenter = CGPoint(x: view.frame.width/2, y: view.frame.height/2)
        let radius = view.frame.width/2 - lineWith / 2
        let path = UIBezierPath(arcCenter: arcCenter,
                                radius: radius,
                                startAngle: CGFloat(Double.pi * -0.5),
                                endAngle: CGFloat(Double.pi * 0.5),
                                clockwise: true)
        path.lineCapStyle = .round
        _layer.path = path.cgPath
        return _layer
    }
    
    private func updateCircleLayer(
        view: UIView,
        lineWith: CGFloat = 10.0,
        fillColor: UIColor = .clear,
        boarderColor: UIColor = .red,
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
        
//        let animation = CAKeyframeAnimation(keyPath: "strokeEnd")
//        animation.values = [0.0, 1.0, 1.0]
//        animation.keyTimes = [0.0, 0.3, 1.0]
//        animation.duration = 3.0
//        animation.repeatCount = .greatestFiniteMagnitude
//        _layer.add(animation, forKey: nil)
        
    }



}

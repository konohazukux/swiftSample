//
//  FirstViewController.swift
//  Sample1128
//
//  Created by TAKESHI SHIMADA on 2019/11/28.
//  Copyright © 2019 TAKESHI SHIMADA. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class FirstViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var phoneTf: UITextField!
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var pageBaseView: UIView!


    var pageViewController: UIPageViewController!
    
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        pageview()
    }
    
    func pageview() {
     
        let label = UILabel()
        label.frame.size = CGSize(width: 200, height: 100)
        label.center = view.center
        label.text = "ベースのview"
        label.textAlignment = .center
        view.addSubview(label)

        // コンテナに追加
        let pageVC = PageViewController(transitionStyle: .scroll,
                                        navigationOrientation: .horizontal,
                                        options: nil)
        let pageViewHeight: CGFloat = 300
//        pageVC.view.frame = CGRect(x: 0, y: view.bounds.size.height - pageViewHeight, width: view.bounds.size.width, height: pageViewHeight)
        pageVC.view.frame = .zero

        addChild(pageVC)
        pageBaseView.addSubview(pageVC.view)
        pageVC.view.translatesAutoresizingMaskIntoConstraints = false
        pageBaseView.topAnchor.constraint(equalTo: pageVC.view.topAnchor).isActive = true
        pageBaseView.bottomAnchor.constraint(equalTo: pageVC.view.bottomAnchor).isActive = true
        pageBaseView.leadingAnchor.constraint(equalTo: pageVC.view.leadingAnchor).isActive = true
        pageBaseView.trailingAnchor.constraint(equalTo: pageVC.view.trailingAnchor).isActive = true
        
//        view.addSubview(pageVC.view)
        pageVC.didMove(toParent: self)

    }

}

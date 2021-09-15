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
       
        let line = DotLineView(frame: .zero)
        line.frame = CGRect.init(x: 100, y: 400, width: 100, height: 1)
        view.addSubview(line)
        
        
    }

    
    
}


class DotLineView: UIView {
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    private func initialize() {
        self.backgroundColor = UIColor.init(red: 0, green: 1, blue: 0, alpha: 1)
        
    }
    
}

//
//  FirstViewController.swift
//  Sample1128
//
//  Created by TAKESHI SHIMADA on 2019/11/28.
//  Copyright © 2019 TAKESHI SHIMADA. All rights reserved.
//

import UIKit
import Combine

class FirstViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var notificationButton: UIButton!
    private var myButton: UIButton!
    
    private var cancellable: AnyCancellable?

    deinit {
        // 適切なタイミングで購読を解除するために、キャンセルを呼び出す
        cancellable?.cancel()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        print("infolog: \(#line)  \(#function) :  \(#line) ") // swift lo
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        print("infolog: \(#line)  \(#function) :  \(#line) ") // swift lo
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showContentView()
    }
    
    func showContentView() {
        let vc = ContentViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
}


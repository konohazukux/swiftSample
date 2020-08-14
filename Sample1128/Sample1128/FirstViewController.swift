//
//  FirstViewController.swift
//  Sample1128
//
//  Created by TAKESHI SHIMADA on 2019/11/28.
//  Copyright © 2019 TAKESHI SHIMADA. All rights reserved.
//

import UIKit
import SafariServices
import RxSwift
import RxCocoa
import SwiftDate

class FirstViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var phoneTf: UITextField!
    @IBOutlet weak var oneButton: UIButton!
    private var myButton: UIButton!
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        show()
    }
    
    func show() {
       
//        let storyboard = UIStoryboard.init(name: "AmountLimit", bundle: nil)
        let storyboard = UIStoryboard.init(name: "AmountLimitCardInfo", bundle: nil)
        guard let viewController = storyboard.instantiateInitialViewController() as? AmountLimitCardInfoVC else { return }
       
        
        present(viewController, animated: true, completion: nil)
        

    }
    

}





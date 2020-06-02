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
    @IBOutlet weak var textField: UITextField!
    private var myButton: UIButton!

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
        
       textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)

        setButton()
       
        temp()

    }
    
    @objc func textFieldDidChange() {
        print("infolog: \(#line)  \(#function) : \(self) ")
      
    }


    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

}



extension FirstViewController {
  
    func temp() {
       
        let calendar = Calendar.current
        let dateComponents1 = DateComponents(calendar: calendar,
                                            year: 2018,
                                            month: 10,
                                            day: 10,
                                            hour: 11,
                                            minute: 12,
                                            second: 34)
        let date1 = calendar.date(from: dateComponents1)!

        let dateComponents2 = DateComponents(calendar: calendar,
                                            year: 2018,
                                            month: 10,
                                            day: 10,
                                            hour: 11,
                                            minute: 13,
                                            second: 35)
        let date2 = calendar.date(from: dateComponents2)!
        
        do {
            let compare2 =  date1.compare(to: date2, granularity: .month) == .orderedSame
            print("infolog: \(#line)  \(#function) : \(compare2) ")
        }

        do {
            let compare2 =  date1.compare(to: date2, granularity: .day) == .orderedSame
            print("infolog: \(#line)  \(#function) : \(compare2) ")
        }

        do {
            let compare2 =  date1.compare(to: date2, granularity: .hour) == .orderedSame
            print("infolog: \(#line)  \(#function) : \(compare2) ")
        }

        do {
            let compare2 =  date1.compare(to: date2, granularity: .minute) == .orderedSame
            print("infolog: \(#line)  \(#function) : \(compare2) ")
        }
    }
    
    
    func showTutorial(_ which: Int) {
        if let url = URL(string: "https://www.neurospace.jp/") {
            let config = SFSafariViewController.Configuration()
            config.entersReaderIfAvailable = true

            let vc = SFSafariViewController(url: url, configuration: config)
            present(vc, animated: true)
        }
    }

    func setButton() {
        myButton = UIButton()
        myButton.frame = CGRect(x:80, y:100, width: 200, height: 40)
        myButton.backgroundColor = UIColor.red
        myButton.layer.masksToBounds = true
        myButton.setTitle("ボタン(通常)", for: .normal)
        myButton.setTitleColor(.white, for: .normal)
        myButton.setTitle("ボタン(押された時)", for: .highlighted)
        myButton.setTitleColor(.black, for: .highlighted)
        myButton.layer.cornerRadius = 20.0
        
        myButton.tag = 1
        myButton.addTarget(self, action: #selector(onClickMyButton(sender:)) , for: .touchUpInside)
        self.view.addSubview(myButton)
    }
    
    func addLabel() {
        let myLabel: UILabel = UILabel(frame: CGRect(x: 100, y: 300 ,width: 100, height: 50))
        myLabel.backgroundColor = UIColor.darkGray
        myLabel.layer.masksToBounds = true
        myLabel.layer.cornerRadius = 20.0
        myLabel.text = "Hey!"
        myLabel.textColor = UIColor.white
        myLabel.shadowColor = UIColor.gray
        myLabel.textAlignment = .center

        self.view.addSubview(myLabel)
    }

    
    @objc func onClickMyButton(sender: UIButton){
        print("onClickMyButton:")
        print("sender.currentTitile: \(String(describing: sender.currentTitle))")
        print("sender.tag:\(sender.tag)")
      
        showTutorial(1)


    }


}














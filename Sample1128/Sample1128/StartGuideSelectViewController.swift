//
//  MissionViewController.swift
//

import Foundation
import UIKit

class StartGuideSelectViewController: UIViewController {

    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        temp()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
   
    func temp() {
       
        [
            StartGuideSelectView.Model.init(title: "title1", caption: "caption1", link: "http://yahoo.co.jp"),
            StartGuideSelectView.Model.init(title: "title2", caption: "caption2", link: "http://google.co.jp")
        ].forEach {
            stackView.addArrangedSubview(StartGuideSelectView(model: $0, parent: self))
        }
        
    }
    
}


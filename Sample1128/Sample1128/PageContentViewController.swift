//
//  PageContentViewController.swift
//  Sample1128
//
//  Created by TAKESHI SHIMADA on 2021/08/17.
//  Copyright © 2021 TAKESHI SHIMADA. All rights reserved.
//

import UIKit

class PageContentViewController: UIViewController {

    var contentNumber: Int?

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let contentNumber = contentNumber else { return }
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: 100))
        label.text = "\(contentNumber + 1)枚目"
        label.textColor = UIColor.white
        label.textAlignment = .center
        view.addSubview(label)
    }
}

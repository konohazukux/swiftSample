//
//  MissionSelectView.swift
//  Sample1128
//
//  Created by TAKESHI SHIMADA on 2022/10/17.
//  Copyright © 2022 TAKESHI SHIMADA. All rights reserved.
//

import UIKit

class MissionSelectView: UIView, UIViewType {
  
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var caption: UILabel!
    
    weak var parent: UIViewController?
    
    static let VIEW_HEIGHT = 81.0
   
    struct Model {
        var title: String
        var caption: String
        var link: String
    }
    
    private var model: Model?
    convenience init(model: Model, parent: UIViewController) {
        self.init(frame: .zero)
        self.model = model
        self.parent = parent
        instantiateView()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        instantiateView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        instantiateView()
    }
    
    func setupView() {
        self.title.text = model?.title
        self.caption.text = model?.caption
    }
    
    @IBAction func viewDidTapped(_ sender: AnyObject) {
       if let model = model,
          let url = URL(string: model.link),
           UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
           parent?.dismiss(animated: true)
        }
    }
    
}

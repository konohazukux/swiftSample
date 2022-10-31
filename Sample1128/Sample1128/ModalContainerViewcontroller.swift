//
//  ModalContainerViewcontroller.swift
//

import Foundation
import UIKit

class ModalContainerViewController: UIViewController {
  
    @IBOutlet private weak var stackView: UIStackView!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.view.backgroundColor = UIColor.init(red: 1, green: 0, blue: 0, alpha: 0.7)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
   
    private weak var _vc: UIViewController?
    private var bottomConstraint: NSLayoutConstraint?
   
    func set(parent: UIViewController) {
        modalPresentationStyle = .overCurrentContext
        parent.present(self, animated: false)
    }
    
    func set(_ vc: UIViewController, height: CGFloat) {
        self._vc = vc
        addChild(vc)
        view.addSubview(vc.view)
        
        vc.view.translatesAutoresizingMaskIntoConstraints = false
        vc.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        vc.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        vc.view.heightAnchor.constraint(equalToConstant: height).isActive = true
        bottomConstraint = view.bottomAnchor.constraint(equalTo: vc.view.bottomAnchor, constant: -height)
        bottomConstraint?.isActive = true
        self.loadViewIfNeeded()
    }
    
    func show() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak self] in
            guard let self = self else { return }
            UIView.animate(
                withDuration: 0.2,
                animations: {
                    self.bottomConstraint?.constant = 0
                    self.view.layoutIfNeeded()
                }, completion: nil)
        }
    }
    
}

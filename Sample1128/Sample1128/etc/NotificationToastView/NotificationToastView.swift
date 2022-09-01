//
//  NotificationToastView.swift
//

import UIKit
import RxCocoa
import RxSwift
import RxRelay

@IBDesignable
class NotificationToastView: UIView, UIViewType {
    
    private let disposeBag = DisposeBag()

    @IBOutlet private weak var nextDateLabel: UILabel!

    private weak var topConstraint: NSLayoutConstraint? = nil
    private weak var bottomConstraint: NSLayoutConstraint? = nil

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        instantiateView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        instantiateView()
    }
    
    convenience init(viewDidTapped: (()->Void)) {
        self.init(frame: .zero)
        instantiateView()
    }

    func setupView() {}
    
    func show(tabBarController: UITabBarController) {
        tabBarController.view.addSubview(self)
        guard let tabBarControllerView = tabBarController.view else { return }
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: tabBarControllerView.leadingAnchor, constant: 16).isActive = true
        self.trailingAnchor.constraint(equalTo: tabBarControllerView.trailingAnchor, constant: -16).isActive = true
        self.heightAnchor.constraint(equalToConstant: 80).isActive = true
        self.topConstraint = self.topAnchor.constraint(equalTo: tabBarControllerView.bottomAnchor, constant: -10)
        self.bottomConstraint = self.bottomAnchor.constraint(equalTo: tabBarController.tabBar.topAnchor, constant: -10)

        self.topConstraint?.isActive = true
        self.bottomConstraint?.isActive = false
        tabBarControllerView.layoutIfNeeded()

        UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseInOut, animations: { [weak self] in
            guard let self = self else { return }
            self.topConstraint?.isActive = false
            self.bottomConstraint?.isActive = true
            tabBarControllerView.layoutIfNeeded()
        }, completion: nil)

    }


}

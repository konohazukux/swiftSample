//
//  NotificationToastView.swift
//

import UIKit

@IBDesignable
class NotificationToastView: UIView, UIViewType {

    private let TOAST_SHOW_TIME = 5.0
    
    private weak var topConstraint: NSLayoutConstraint?
    private weak var bottomConstraint: NSLayoutConstraint?
    
    private var tabBarController: UITabBarController?
    private var tapAction: (() -> Void)?

    deinit {
        print("deinit")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        instantiateView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        instantiateView()
    }
    
    convenience init(tabBarController: UITabBarController, tapAction: @escaping (() -> Void)) {
        self.init(frame: .zero)
        self.tabBarController = tabBarController
        self.tapAction = tapAction
        instantiateView()
    }

    func setupView() {
        let swipeDown = UISwipeGestureRecognizer()
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
        swipeDown.addTarget(self, action:#selector(self.swipeDown))
        self.addGestureRecognizer(swipeDown)

        let tap = UITapGestureRecognizer(target: self, action:#selector(self.tap))
        self.addGestureRecognizer(tap)
    }

    @objc
    private func tap() {
        self.tapAction?()
    }
    
    @objc
    private func swipeDown() {
        hide()
    }
    
    func show() {
        guard let tabBarController = tabBarController else { return }
        tabBarController.view.addSubview(self)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: tabBarController.view.leadingAnchor, constant: 16).isActive = true
        self.trailingAnchor.constraint(equalTo: tabBarController.view.trailingAnchor, constant: -16).isActive = true
        self.topConstraint = self.topAnchor.constraint(equalTo: tabBarController.view.bottomAnchor, constant: 0)

        self.topConstraint?.isActive = true
        tabBarController.view.layoutIfNeeded()

        let tabBarViewHeight = tabBarController.tabBar.frame.height + self.frame.height
        UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseInOut, animations: { [weak self] in
            guard let self = self else { return }
            self.topConstraint?.constant = -1 * tabBarViewHeight - 16
            tabBarController.view.layoutIfNeeded()
        }, completion: nil)

        DispatchQueue.main.asyncAfter(deadline: .now() + TOAST_SHOW_TIME) {
            [weak self] in guard let self = self else { return }
            self.hide()
        }
    }
    
    func hide() {
        UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseInOut, animations: { [weak self] in
            guard let self = self else { return }
            self.topConstraint?.constant = 0
            self.tabBarController?.view.layoutIfNeeded()
        }, completion: { [weak self] _ in
            guard let self = self else { return }
            self.removeFromSuperview()
        })
    }

}

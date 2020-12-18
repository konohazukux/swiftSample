//
//  UIViewController+Extended.swift
//  ToyotaWallet
//

import UIKit

extension UIViewController {
    @objc
    func dismissSelf() {
        dismiss(animated: true, completion: nil)
    }

    @objc
    func dismissRoot() {
        if let p = presentingViewController {
            p.dismissRoot()
        } else {
            dismiss(animated: true, completion: nil)
        }
    }

    @objc
    func clearModalStack() {
        if let p = presentedViewController {
            p.clearModalStack()
        } else {
            let parent = presentingViewController
            dismiss(animated: false) {
                parent?.clearModalStack()
            }
        }
    }

    @objc
    func pop() {
        _ = navigationController?.popViewController(animated: true)
    }
}

extension UIViewController {
    // コンテンツにビューコントロールを追加する
    func addContentController(_ child: UIViewController) {
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }

    func addContentControllers(_ childs: UIViewController...) {
        for controller in childs {
            addContentController(controller)
        }
    }

    func embedInNavigationController() -> UIViewController {
        let nav = UINavigationController(rootViewController: self)
        return nav
    }

    func setChildVC(_ childVC: UIViewController) {
        // ドライバービューで子を削除する
        for child in children {
            child.willMove(toParent: self)
            child.view.removeFromSuperview()
            child.removeFromParent()
        }
        // ドライバービュー を設定して追加する
        childVC.view.frame = view.bounds
        addChild(childVC)
        view.addSubview(childVC.view)
        childVC.didMove(toParent: self)
    }

    // ビューコントローラを親から削除する
    func removeFromParentVC(_ parentVC: UIViewController) {
        willMove(toParent: parentVC)
        view.removeFromSuperview()
        removeFromParent()
    }

    // 最上位のビューコントローラを取得する
    func topMostViewController() -> UIViewController? {
        if presentedViewController == nil {
            return self
        }
        if let navigation = self as? UINavigationController {
            return navigation.visibleViewController!.topMostViewController()
        }
        if let tab = self as? UITabBarController {
            if let selectedTab = tab.selectedViewController {
                return selectedTab.topMostViewController()
            }
            return tab.topMostViewController()
        }
        return presentedViewController!.topMostViewController()
    }

    //  最上位ベースのビューコントローラを取得
    func topBaseMostViewController() -> BaseViewController? {
        if let root = self as? RootViewController {
            return root.children.first!.topBaseMostViewController()
        }

        if let navigation = self as? UINavigationController {
            return navigation.visibleViewController!.topBaseMostViewController()
        }

        if let tab = self as? UITabBarController {
            if let selectedTab = tab.selectedViewController {
                return selectedTab.topBaseMostViewController()
            }
            return tab.topBaseMostViewController()
        }

        if presentedViewController == nil {
            return self as? BaseViewController
        }
        return presentedViewController!.topBaseMostViewController()
    }

    func add(_ child: UIViewController, frame: CGRect? = nil) {
        addChild(child)

        if let frame = frame {
            child.view.frame = frame
        }

        view.addSubview(child.view)
        child.didMove(toParent: self)
    }

    func remove() {
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}

extension UIViewController {
    var topbarHeight: CGFloat {
        UIApplication.shared.statusBarFrame.size.height +
            (navigationController?.navigationBar.frame.height ?? 0.0)
    }
}

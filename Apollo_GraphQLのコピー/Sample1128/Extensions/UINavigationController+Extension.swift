//
//  UIViewController+Extension.swift
//  ToyotaWallet
//

import Foundation
import UIKit

extension UINavigationController {
    open override var childForStatusBarStyle: UIViewController? {
        visibleViewController
    }

    public func pushViewController(viewController: UIViewController,
                                   animated: Bool,
                                   completion: (() -> Void)?) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        pushViewController(viewController, animated: animated)
        CATransaction.commit()
    }

    public func popToViewController(animated: Bool,
                                    completion: (() -> Void)?) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        popViewController(animated: animated)
        CATransaction.commit()
    }

    public func popToRootViewController(animated: Bool,
                                        completion: (() -> Void)?) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        popToRootViewController(animated: animated)
        CATransaction.commit()
    }
}

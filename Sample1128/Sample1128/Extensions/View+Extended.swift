//
//  View+Extended.swift
//  ToyotaWallet
//

import Foundation

extension UIView {
    func repeatedTapGuard(waitTime: TimeInterval = 0.3) {
        isUserInteractionEnabled = false
        DispatchQueue.main.asyncAfter(deadline: .now() + waitTime) { [weak self] in
            self?.isUserInteractionEnabled = true
        }
    }
}

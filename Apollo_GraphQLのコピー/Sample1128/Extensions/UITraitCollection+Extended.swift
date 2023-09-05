//
//  UITraitCollection+Extended.swift
//  ToyotaWallet
//

import Foundation

public extension UITraitCollection {
    static var isDarkMode: Bool {
        if #available(iOS 13, *), current.userInterfaceStyle == .dark {
            return true
        }
        return false
    }
}

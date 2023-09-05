//
//  UIFont+Extended.swift
//  ToyotaWallet
//

import UIKit

extension UIFont {
    static func hiraginoSansW3(_ size: CGFloat) -> UIFont {
        UIFont(name: "HiraginoSans-W3", size: size) ?? UIFont.systemFont(ofSize: size)
    }

    static func hiraginoSansW6(_ size: CGFloat) -> UIFont {
        UIFont(name: "HiraginoSans-W6", size: size) ?? UIFont.systemFont(ofSize: size)
    }

    static func avenirMedium(_ size: CGFloat) -> UIFont {
        UIFont(name: "Avenir-Medium", size: size) ?? UIFont.systemFont(ofSize: size)
    }

    static func avenirHeavy(_ size: CGFloat) -> UIFont {
        UIFont(name: "Avenir-Heavy", size: size) ?? UIFont.systemFont(ofSize: size)
    }
}

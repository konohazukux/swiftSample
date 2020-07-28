//
//  NSObject+Extended.swift
//  ToyotaWallet
//

import UIKit

extension NSObject {
    class var name: String {
        String(describing: self)
    }

    class var className: String {
        NSStringFromClass(self).components(separatedBy: ".").last!
    }

    var className: String {
        NSStringFromClass(type(of: self)).components(separatedBy: ".").last!
    }
}

//
//  Numeric+Extended.swift
//  ToyotaWallet
//

import Foundation

public extension Double {
    var toInt: Int { Int(self) }
    var toFloat: Float { Float(self) }
    var toCGFloat: CGFloat { CGFloat(self) }

    var toCurrency: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = ""
        return formatter.string(from: NSNumber(value: self))!
    }
}

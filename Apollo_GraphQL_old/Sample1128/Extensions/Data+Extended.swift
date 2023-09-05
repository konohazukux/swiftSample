//
//  Data+Extended.swift
//  ToyotaWallet
//

import UIKit

public extension Data {
    var hexadecimalString: String {
        var bytes = [UInt8](repeating: 0, count: count)
        copyBytes(to: &bytes, count: count)

        let hexString = NSMutableString()
        for byte in bytes {
            hexString.appendFormat("%02x", UInt(byte))
        }

        return String(hexString)
    }
}

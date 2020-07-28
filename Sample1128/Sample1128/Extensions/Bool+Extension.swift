//
//  Bool+Extension.swift
//  ToyotaWallet
//
//  Created by satoru-kibe on 2019/09/03.
//

import Foundation

extension Bool {
    var intValue: Int {
        self ? 1 : 0
    }

    var stringValue: String {
        self ? "1" : "0"
    }
}

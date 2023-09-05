//
//  WalletCommon.swift
//  ToyotaWallet
//
//  Created by satoru-kibe on 2019/09/18.
//

import Foundation

enum WalletCommon {
    /// URLが有効か確認します
    static func verifyUrl(string: String) -> Bool {
        guard let url = URL(string: string) else { return false }
        return UIApplication.shared.canOpenURL(url)
    }
}

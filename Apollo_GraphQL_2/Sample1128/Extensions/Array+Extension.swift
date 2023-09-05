//
//  Array+Extension.swift
//  ToyotaWallet
//
//  Created by satoru-kibe on 2019/08/27.
//

import Foundation

extension Array {
    /// 存在しない index を参照した場合 nil を戻す safe 配列参照
    func at(_ index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}

//
//  BehaviorRelay+.swift
//  ToyotaWallet
//
//  Created by Yuto Mizutani on 2020/05/12.
//

import RxCocoa
import RxSwift

extension SharedSequenceConvertibleType where SharingStrategy == DriverSharingStrategy {
    func drive(_ relay: BehaviorRelay<Element>) -> Disposable {
        drive(onNext: {
            relay.accept($0)
        })
    }
}

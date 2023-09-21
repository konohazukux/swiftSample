//
//  PublishRelay+.swift
//  ToyotaWallet
//
//  Created by Yuto Mizutani on 2020/05/12.
//

import RxCocoa
import RxSwift

public extension PublishRelay {
    /// Converts `PublishRelay` to `Driver`.
    ///
    /// - returns: Observable sequence.
    func asDriver() -> Driver<Element> {
        asObservable()
            .observeOn(DriverSharingStrategy.scheduler)
            .asDriverOnErrorNeverComplete()
    }
}

public extension PublishRelay where Element == Void {
    func accept() {
        accept(())
    }
}

extension SharedSequenceConvertibleType where SharingStrategy == DriverSharingStrategy {
    func drive(_ relay: PublishRelay<Element>) -> Disposable {
        drive(onNext: {
            relay.accept($0)
        })
    }
}

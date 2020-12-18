//
//  DriverRelay.swift
//  ToyotaWallet
//
//  Created by Yuto Mizutani on 2020/05/12.
//

import RxCocoa
import RxSwift

/// Hot な Relay
///
/// Hot な PublishRelay の Driver を内包する型
typealias DriverRelay = DriverPublishRelay

/// Hot な Relay
///
/// Hot な PublishRelay の Driver を内包する型
final class DriverPublishRelay<Element>: RxSwift.ObservableType {
    private let relay: PublishRelay<Element> = PublishRelay()
    lazy var driver: Driver<Element> = relay.asDriver()

    init() {}

    func accept(_ event: Element) {
        relay.accept(event)
    }

    /// Subscribes observer
    func subscribe<Observer>(_ observer: Observer) -> RxSwift.Disposable where Element == Observer.Element, Observer: RxSwift.ObserverType {
        asObservable().subscribe(observer)
    }

    /// - returns: Canonical interface for push style sequence
    func asObservable() -> RxSwift.Observable<Element> {
        relay.asObservable()
    }
}

extension DriverPublishRelay where Element == Void {
    func accept() {
        accept(())
    }
}

extension SharedSequenceConvertibleType where SharingStrategy == DriverSharingStrategy {
    func drive(_ relay: DriverPublishRelay<Element>) -> Disposable {
        drive(onNext: {
            relay.accept($0)
        })
    }
}

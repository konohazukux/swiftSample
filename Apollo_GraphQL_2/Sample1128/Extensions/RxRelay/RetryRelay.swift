//
//  RetryRelay.swift
//  ToyotaWallet
//
//  Created by Yuto Mizutani on 2020/05/12.
//

import RxCocoa
import RxSwift

typealias RetryRelay = RetryPublishRelay

final class RetryPublishRelay<Element>: RxSwift.ObservableType {
    private let relay: PublishRelay<Element> = PublishRelay()
    let retryRelay: PublishRelay<Void> = PublishRelay()

    init() {}

    func accept(_ event: Element) {
        relay.accept(event)
    }

    func retry() {
        retryRelay.accept()
    }

    /// Subscribes observer
    func subscribe<Observer>(_ observer: Observer) -> RxSwift.Disposable where Element == Observer.Element, Observer: RxSwift.ObserverType {
        asObservable().subscribe(observer)
    }

    /// - returns: Canonical interface for push style sequence
    func asObservable() -> RxSwift.Observable<Element> {
        let observable = relay.asObservable().share(replay: 1)
        return Observable.merge(
            observable,
            retryRelay.withLatestFrom(observable)
        )
    }
}

extension RetryPublishRelay {
    /// Converts `PublishRelay` to `Driver`.
    ///
    /// - returns: Observable sequence.
    func asDriver() -> Driver<Element> {
        asObservable()
            .observeOn(DriverSharingStrategy.scheduler)
            .asDriverOnErrorNeverComplete()
    }
}

extension RetryPublishRelay where Element == Void {
    func accept() {
        accept(())
    }
}

extension SharedSequenceConvertibleType where SharingStrategy == DriverSharingStrategy {
    func drive(_ relay: RetryPublishRelay<Element>) -> Disposable {
        drive(onNext: {
            relay.accept($0)
        })
    }
}

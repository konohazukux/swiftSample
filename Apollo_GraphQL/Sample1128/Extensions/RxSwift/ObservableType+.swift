//
//  ObservableType+.swift
//  ToyotaWallet
//
//  Created by Yuto Mizutani on 2020/05/12.
//

import RxCocoa
import RxSwift

extension ObservableType {
    func neverComplete() -> Observable<Element> {
        concat(Observable.never())
    }

    func onErrorNeverComplete() -> Observable<Element> {
        catchError { _ in
            Observable.never()
        }
    }

    /// Map from any to void
    func mapToVoid() -> Observable<Void> {
        map { _ in }
    }

    func mapToOptional() -> Observable<Element?> {
        map { Optional($0) }
    }

    func mapToTrue() -> Observable<Bool> {
        map { _ in true }
    }

    func mapToFalse() -> Observable<Bool> {
        map { _ in false }
    }

    func toggle(startWith: Bool = false) -> Observable<Bool> {
        scan(!startWith) { flag, _ in !flag }
    }

    func asDriverOnErrorNeverComplete() -> Driver<Element> {
        asDriver { _ in
            Driver.never()
        }
    }

    /// Observable Current and Previous Value
    func withPrevious(startWith e: Element? = nil) -> Observable<(previous: Element, current: Element)> {
        scan((e, e)) { ($0.1, $1) }
            .filter { $0.0 != nil && $0.1 != nil }.map { ($0.0!, $0.1!) }
    }

    func unwrap<T>() -> Observable<T> where Element == T? {
        filter { $0 != nil }.map { $0! }
    }

    func subscribeOnConcurrentGlobalDispatch() -> Observable<Element> {
        subscribeOn(ConcurrentDispatchQueueScheduler(queue: .global()))
    }
}

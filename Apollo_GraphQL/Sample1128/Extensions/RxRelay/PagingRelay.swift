//
//  PagingRelay.swift
//  ToyotaWallet
//
//  Created by Yuto Mizutani on 2020/05/20.
//

import RxCocoa
import RxSwift

enum PagingState {
    case refresh
    case next
}

typealias PagingRelay = PagingPublishRelay

final class PagingPublishRelay<Element>: RxSwift.ObservableType {
    private let firstPage: Int
    private(set) var page: Int
    private let relay: PublishRelay<(page: Int, element: Element)> = PublishRelay()

    var element: Observable<(page: Int, element: Element)> {
        relay.asObservable().share(replay: 1)
    }

    init(page: Int) {
        self.firstPage = page
        self.page = page
    }

    func refresh(_ event: Element) {
        page = firstPage
        relay.accept((page, event))
    }

    func next(_ event: Element) {
        page += 1
        relay.accept((page, event))
    }

    func accept(_ event: Element, state: PagingState) {
        switch state {
        case .refresh:
            refresh(event)
        case .next:
            next(event)
        }
    }

    /// Subscribes observer
    func subscribe<Observer>(_ observer: Observer) -> RxSwift.Disposable where Element == Observer.Element, Observer: RxSwift.ObserverType {
        asObservable().subscribe(observer)
    }

    /// - returns: Canonical interface for push style sequence
    func asObservable() -> RxSwift.Observable<Element> {
        relay.asObservable()
            .map { $0.element }
            .share(replay: 1)
    }
}

//
//  SharedSequenceConvertibleType+.swift
//  ToyotaWallet
//
//  Created by Yuto Mizutani on 2020/05/12.
//

import RxCocoa
import RxSwift

public extension SharedSequenceConvertibleType {
    func mapToVoid() -> SharedSequence<SharingStrategy, Void> {
        map { _ in }
    }

    func mapToOptional() -> SharedSequence<SharingStrategy, Element?> {
        map { Optional($0) }
    }

    func mapToTrue() -> SharedSequence<SharingStrategy, Bool> {
        map { _ in true }
    }

    func mapToFalse() -> SharedSequence<SharingStrategy, Bool> {
        map { _ in false }
    }

    func unwrap<T>() -> SharedSequence<SharingStrategy, T> where Element == T? {
        filter { $0 != nil }.map { $0! }
    }

    func asDriverOnErrorNeverComplete() -> Driver<Element> {
        asDriver { _ in
            Driver.never()
        }
    }

    func scanMap<Result>(_ seed: Self.Element, selector: @escaping (Self.Element, Self.Element) -> Result) -> RxCocoa.SharedSequence<Self.SharingStrategy, Result> {
        var result: Result!
        return scan(seed, accumulator: { oldValue, newValue in
            result = selector(oldValue, newValue)
            return newValue
        })
            .map { _ in result! }
    }
}

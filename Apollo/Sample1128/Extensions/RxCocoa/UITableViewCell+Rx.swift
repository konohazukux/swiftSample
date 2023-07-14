//
//  UITableViewCell+Rx.swift
//  GiftPresentation
//
//  Created by Yuto Mizutani on 2020/01/07.
//

// NOTE: See more discussions - https://github.com/ReactiveX/RxSwift/issues/821

import RxCocoa
import RxSwift
import UIKit

private var prepareForReuseBag: Int8 = 0

@objc public protocol Reusable: AnyObject {
    func prepareForReuse()
}

extension UITableViewCell: Reusable {}
extension UITableViewHeaderFooterView: Reusable {}
extension UICollectionReusableView: Reusable {}

extension Reactive where Base: Reusable {
    var prepareForReuse: Observable<Void> {
        Observable.of(sentMessage(#selector(Base.prepareForReuse)).map { _ in }, deallocated).merge()
    }

    var reuseBag: DisposeBag {
        MainScheduler.ensureExecutingOnScheduler()

        if let bag = objc_getAssociatedObject(base, &prepareForReuseBag) as? DisposeBag {
            return bag
        }

        let bag = DisposeBag()
        objc_setAssociatedObject(base, &prepareForReuseBag, bag, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)

        _ = sentMessage(#selector(Base.prepareForReuse))
            .subscribe(onNext: { [weak base] _ in
                guard let base = base else { return }
                let newBag = DisposeBag()
                objc_setAssociatedObject(base, &prepareForReuseBag, newBag, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
            })

        return bag
    }
}

extension Reactive where Base: UITableViewCell {
    var selectionStyle: Binder<UITableViewCell.SelectionStyle> {
        Binder(base) { cell, selectionStyle in
            cell.selectionStyle = selectionStyle
        }
    }
}

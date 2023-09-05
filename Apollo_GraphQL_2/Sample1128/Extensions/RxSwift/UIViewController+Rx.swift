//
//  UIViewController+Rx.swift
//  ToyotaWallet
//
//  Created by Yuto Mizutani on 2020/05/18.
//

import RxSwift
import UIKit

extension Reactive where Base: UIViewController {
    var viewDidLoad: Observable<[Any]> {
        sentMessage(#selector(base.viewDidLoad)).share(replay: 1)
    }

    var viewDidLoadAndJust: Observable<Void> {
        Observable.concat(Observable.just(()), viewDidLoad.mapToVoid()).share(replay: 1)
    }

    var viewWillAppear: Observable<[Any]> {
        sentMessage(#selector(base.viewWillAppear)).share(replay: 1)
    }

    var viewDidAppear: Observable<[Any]> {
        sentMessage(#selector(base.viewDidAppear)).share(replay: 1)
    }

    var viewWillDisappear: Observable<[Any]> {
        sentMessage(#selector(base.viewWillDisappear)).share(replay: 1)
    }

    /// 遷移完了時
    var viewDidDisappear: Observable<[Any]> {
        sentMessage(#selector(base.viewDidDisappear)).share(replay: 1)
    }
}

//
//  Sally.swift
//  SampleFM
//
//  Created by TAKESHI SHIMADA on 2022/01/13.
//

import Foundation
import RxCocoa
import RxSwift

// Sally.swift

public class Sally: NSObject {
    let disposeBag = DisposeBag()
    public func sallyMethod() {
        print("Sally().sallyMethod is called !!")

        Observable<Int>.just(1)
            .subscribe(onNext: { 
               print($0)
            } )
            .disposed(by: disposeBag)
    }
}

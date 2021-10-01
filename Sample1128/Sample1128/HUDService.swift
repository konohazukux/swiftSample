//
//  HUDservice.swift
//  Sample1128
//

import PKHUD
import RxSwift
import RxCocoa

final class HUDService {
   
    public static let shared = HUDService()

    let hud = PKHUD()

    func show() {
        hud.contentView = PKHUDProgressView()
        hud.show()
    }
    
    func hide(animated: Bool, completion: ((Bool) -> Void)? = nil) {
        hud.hide(animated, completion: completion)
    }
    
    var isLoadActive: Binder<Bool> {
      return Binder(self) {
        $1 ? $0.show() : $0.hide(animated: false, completion: nil)
      }
    }
    
    func bindHUD(disposeBag: DisposeBag) -> ActivityIndicator {
        let indicator = ActivityIndicator()
        indicator.asObservable()
            .bind(to: HUDService.shared.isLoadActive)
            .disposed(by: disposeBag)
        return indicator
    }

}
    

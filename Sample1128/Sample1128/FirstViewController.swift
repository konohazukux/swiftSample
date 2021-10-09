//
//  FirstViewController.swift
//  Sample1128
//

import UIKit
import RxSwift
import RxCocoa
import PAYJP

class FirstViewController: UIViewController {

    let disposeBag = DisposeBag()
    @IBOutlet var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        PAYJPSDK.publicKey = "pk_test_0383a1b8f91e8a6e3ea0e2a9"
        PAYJPSDK.locale = Locale.current
        
        button.rx.tap
            .asDriver()
            .drive(onNext: { _ in
                self.temp()
            })
            .disposed(by: disposeBag)
            
        
    }
    
    func temp() {
        // ViewControllerから呼び出す
        let style = FormStyle(
            labelTextColor: .black,
            inputTextColor: .black,
            tintColor: .blue)
        let cardFormViewController = CardFormViewController.createCardFormViewController(style: style, delegate: self, viewType: .labelStyled)
        self.navigationController?.pushViewController(cardFormViewController, animated: true)
    }
    
}

extension FirstViewController: CardFormViewControllerDelegate {
    func cardFormViewController(_: CardFormViewController, didCompleteWith result: CardFormResult) {
        print("111 sdf\(#line) \(type(of: self))  \(#function) : \(self) ")
    }
    
    func cardFormViewController(_: CardFormViewController, didProduced token: Token, completionHandler: @escaping (Error?) -> Void) {
        print("111 sdf\(#line) \(type(of: self))  \(#function) : \(self) ")
    }
}

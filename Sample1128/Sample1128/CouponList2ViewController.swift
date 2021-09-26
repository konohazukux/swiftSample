//
//  CouponListViewController.swift
//  Sample1128
//

import UIKit

class CouponList2ViewController: UIViewController {
    @IBOutlet private weak var stackView: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let view = CouponView(frame: .zero)
        stackView.addArrangedSubview(view)

        let serviceTicketView = ServiceTicketView(frame: .zero)
        stackView.addArrangedSubview(serviceTicketView)

        view.layoutIfNeeded()
        
    }

}

class CouponSelectScrollView: UIScrollView {
    /// ScrollView上のボタン上でドラッグした時、ドラッグを優先する
    override func touchesShouldCancel(in view: UIView) -> Bool {
        if let _ = view as? UIButton {
            return true
        }
        return super.touchesShouldCancel(in: view)
    }
}

//
//  CouponListViewController.swift
//  Sample1128
//

import UIKit

class CouponSaleListViewController: UIViewController {
    @IBOutlet private weak var stackView: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let view = CouponSaleView(frame: .zero)
        view.purchaseAction = { [weak self] in
            self?.purchase()
        }
        stackView.addArrangedSubview(view)

        let view2 = CouponSaleView(frame: .zero)
        stackView.addArrangedSubview(view2)

        
        view.layoutIfNeeded()
        
    }
    
    private func purchase() {
        let controller = CouponPurchaseViewController()
        present(controller, animated: true, completion: nil)
    }
    
}

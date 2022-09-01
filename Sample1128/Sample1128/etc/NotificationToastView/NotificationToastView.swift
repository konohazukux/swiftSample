//
//  NotificationToastView.swift
//

import UIKit
import RxCocoa
import RxSwift
import RxRelay

@IBDesignable
class NotificationToastView: UIView, UIViewType {
    
    private let disposeBag = DisposeBag()

    @IBOutlet private(set) weak var controlView: UIControl!
    @IBOutlet private weak var backgroundView: UIView!
    @IBOutlet private weak var nextDateLabel: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        instantiateView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        instantiateView()
    }
    
    convenience init(viewDidTapped: (()->Void)) {
        self.init(frame: .zero)
        instantiateView()
    }

    func setupView() {
        
    }
    

}

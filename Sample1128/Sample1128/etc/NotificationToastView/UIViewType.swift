//
//  UIViewType.swift
//  SegaPlato
//

import Foundation
import RxSwift
import RxRelay

protocol UIViewType {
    func setupView()
}
extension UIViewType where Self: UIView {
    func instantiateView() {
        let classNameString = String(describing: type(of: self))
        let nib = UINib(nibName: classNameString, bundle: .main)
        let rootView = nib.instantiate(withOwner: self).first as! UIView
        rootView.frame = self.bounds
        self.addSubview(rootView)
        
        setupView()
    }
}


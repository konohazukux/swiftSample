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
       
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: rootView.topAnchor, constant: 0.0),
            self.leftAnchor.constraint(equalTo: rootView.leftAnchor, constant: 0.0),
            self.rightAnchor.constraint(equalTo: rootView.rightAnchor, constant: 0.0),
            self.bottomAnchor.constraint(equalTo: rootView.bottomAnchor, constant: 0.0),
            ])
        
        setupView()
    }
}


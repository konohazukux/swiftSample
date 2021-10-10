//
//  EditAddressSpaceView.swift
//  Sample1128
//

import UIKit

class EditAddressSpaceView: UIView {
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        instantiateView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
    private func instantiateView() {
        let classNameString = String(describing: type(of: self))
        let nib = UINib(nibName: classNameString, bundle: .main)
        let rootView = nib.instantiate(withOwner: self).first as! UIView
        rootView.translatesAutoresizingMaskIntoConstraints = false
        rootView.addToView(parant: self)
    }
}

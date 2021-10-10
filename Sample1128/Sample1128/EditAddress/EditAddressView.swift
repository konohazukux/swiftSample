//
//  EditAddressView.swift
//  Sample1128
//

import UIKit

class EditAddressView: UIView {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var topBorderLeadingConstraint: NSLayoutConstraint!
    @IBOutlet private weak var topBorderView: UIView!
    @IBOutlet private weak var bottomBorderView: UIView!

    private var addressInfoType: EditAddressViewModel.AddressInfoType!
    
    convenience init(addressInfoType: EditAddressViewModel.AddressInfoType) {
        self.init(frame: .zero)
        self.addressInfoType = addressInfoType
        setView()
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
    
    private func setView() {
        bottomBorderView.isHidden = !addressInfoType.isBottom
        titleLabel.text = addressInfoType.title
        textField.placeholder = addressInfoType.placeHolder
        topBorderLeadingConstraint.constant = addressInfoType.isTop ? 0 : 16
    }
}

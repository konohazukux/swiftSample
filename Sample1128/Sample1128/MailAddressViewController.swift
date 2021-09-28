//
//  MailAddressViewController.swift
//  SegaPlato
//

import UIKit
import RxSwift
import RxRelay
import PKHUD

extension UIButton {
    func setEnabled(isEnable: Bool) {
        backgroundColor = isEnable ? .orange : .lightGray
    }
}

class MailAddressViewController: UIViewController {

    @IBOutlet private weak var mailTextField: UITextField!
    @IBOutlet private weak var submitButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        HUD.show(.progress)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
//            HUD.hide()
            self?.dismiss(animated: true, completion: nil)
        }
        

    }
    
    private func bind() {
        


    }
  
}


extension MailAddressViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let isEnable = textField.text.map { $0.isValidEmail } ?? false
        submitButton.setEnabled(isEnable: isEnable)
        return true
    }
}

fileprivate extension String {
    var isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: self)
        return result
    }
}

//
//  UIView+Extended.swift
//  ToyotaWallet
//

import UIKit

extension UIView {
    func equalToSuperView() {
        guard let sv = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: sv.topAnchor),
            bottomAnchor.constraint(equalTo: sv.bottomAnchor),
            leftAnchor.constraint(equalTo: sv.leftAnchor),
            rightAnchor.constraint(equalTo: sv.rightAnchor)
        ])
    }

    func pinToSuperView(top: CGFloat, bottom: CGFloat, left: CGFloat, right: CGFloat) {
        guard let sv = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: sv.topAnchor, constant: top),
            bottomAnchor.constraint(equalTo: sv.bottomAnchor, constant: bottom),
            leftAnchor.constraint(equalTo: sv.leftAnchor, constant: left),
            rightAnchor.constraint(equalTo: sv.rightAnchor, constant: right)
        ])
    }

    func pin(to view: UIView, top: CGFloat, bottom: CGFloat, left: CGFloat, right: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: view.topAnchor, constant: top),
            bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: bottom),
            leftAnchor.constraint(equalTo: view.leftAnchor, constant: left),
            rightAnchor.constraint(equalTo: view.rightAnchor, constant: right)
        ])
    }

    @discardableResult func addTopBorder(color: UIColor, width: CGFloat, leftMargein: CGFloat = 0, rightMargin: CGFloat = 0) -> UIView {
        let layer = CALayer()
        layer.borderColor = color.cgColor
        layer.borderWidth = width
        layer.frame = CGRect(x: leftMargein, y: 0, width: frame.size.width - leftMargein - rightMargin, height: width)
        self.layer.addSublayer(layer)
        return self
    }

    @discardableResult func addBottomBorder(color: UIColor, width: CGFloat, leftMargin: CGFloat = 0, rightMargin: CGFloat = 0) -> UIView {
        let layer = CALayer()
        layer.borderColor = color.cgColor
        layer.borderWidth = width
        layer.frame = CGRect(x: leftMargin, y: frame.size.height - width, width: frame.size.width - leftMargin - rightMargin, height: width)
        self.layer.addSublayer(layer)
        return self
    }
}

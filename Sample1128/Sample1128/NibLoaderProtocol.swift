//
//  NibLoaderProtocol.swift
//  ToyotaWallet
//
//  Created by satoru-kibe on 2019/08/27.
//

import UIKit

protocol NibLoaderProtocol {
    func addNib()
    func addNib(name: String)
    func addNibWithLayout()
}

extension NibLoaderProtocol where Self: UIView {
    func addNib() {
        addNib(name: type(of: self).description().components(separatedBy: ".").last!)
    }

    func addNib(name: String) {
        let view = Bundle.main.loadNibNamed(
            name,
            owner: self,
            options: nil
        )?.first as! UIView
        view.frame = bounds
        addSubview(view)
    }
}

extension NibLoaderProtocol where Self: UIView {
    func addNibWithLayout() {
        if let view = Bundle(for: type(of: self))
            .loadNibNamed(
                String(describing: type(of: self)),
                owner: self, options: nil
            )?.first as? UIView {
            addSubview(view)
            view.topAnchor.constraint(equalTo: topAnchor).isActive = true
            view.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
            view.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
            view.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        }
    }
}

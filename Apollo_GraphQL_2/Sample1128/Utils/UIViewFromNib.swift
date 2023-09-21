//
//  UIViewFromNib.swift
//  ToyotaWallet
//
//  Created by ZhihuaZhang on 2020/06/24.
//

import UIKit

open class UIViewFromNib: UIView {
    public override init(frame: CGRect) {
        super.init(frame: frame)

        nibInit()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        nibInit()
    }

    // MARK: - Private Methods

    private func nibInit() {
        guard let view = UINib(nibName: className, bundle: nil).instantiate(withOwner: self, options: nil).first as? UIView else {
            return
        }

        addCoverView(view)
    }
}

extension UIView {
    public func addCoverView(_ view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false

        addSubview(view)

        let constraints = [
            leadingAnchor.constraint(equalTo: view.leadingAnchor),
            trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topAnchor.constraint(equalTo: view.topAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]

        constraints.forEach { $0.isActive = true }
    }
}

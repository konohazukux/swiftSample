//
//  UIButton+Extension.swift
//  ToyotaWallet
//

import Foundation
import UIKit

extension UIButton {
    func leftImage(image: UIImage, renderMode: UIImage.RenderingMode, spaceLeft: CGFloat) {
        setImage(image.withRenderingMode(renderMode), for: .normal)
        imageEdgeInsets = UIEdgeInsets(top: 0, left: spaceLeft, bottom: 0, right: image.size.width / 2)
        contentHorizontalAlignment = .left
        imageView?.contentMode = .scaleAspectFit
    }

    func rightImage(image: UIImage, renderMode: UIImage.RenderingMode, spaceRight: CGFloat) {
        setImage(image.withRenderingMode(renderMode), for: .normal)
        imageEdgeInsets = UIEdgeInsets(top: 0, left: image.size.width / 2, bottom: 0, right: spaceRight)
        contentHorizontalAlignment = .right
        imageView?.contentMode = .scaleAspectFit
    }

    func underLine() {
        guard let text = titleLabel?.text else { return }
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: text.count))
        setAttributedTitle(attributedString, for: .normal)
    }
}

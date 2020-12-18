//
//  UIBarButtonItem+Extension.swift
//  ToyotaWallet
//

import UIKit

private var handle: UInt8 = 0

/// バッジ表示処理。
/// 参考：https://gist.github.com/freedom27/c709923b163e26405f62b799437243f4
extension UIBarButtonItem {
    private var badgeLayer: CAShapeLayer? {
        if let b: AnyObject = objc_getAssociatedObject(self, &handle) as AnyObject? {
            return b as? CAShapeLayer
        }
        return nil
    }

    func setBadge(badgeLabel: UILabel) {
        badgeLayer?.removeFromSuperlayer()
        addBadge(badgeLabel: badgeLabel)
    }

    private func addBadge(badgeLabel: UILabel) {
        guard let view = value(forKey: "view") as? UIView else {
            return
        }

        // initialize Badge
        let badge = CAShapeLayer()
        let badgeFrame = badgeLabel.frame

        badge.drawRoundedRect(
            rect: badgeFrame,
            cornerRadius: badgeLabel.cornerRadius.toCGFloat,
            andColor: badgeLabel.backgroundColor ?? UIColor.black
        )
        view.layer.addSublayer(badge)

        // テキストのサイズから表示するframeを作成
        var attributes = [NSAttributedString.Key: Any]()
        attributes[.font] = badgeLabel.font
        let textSize = badgeLabel.text?.size(withAttributes: attributes) ?? CGSize.zero
        let x = badgeFrame.minX + (badgeFrame.width - textSize.width) / 2
        let y = badgeFrame.minY + (badgeFrame.height - textSize.height) / 2
        let height = textSize.height
        let width = textSize.width
        let textFrame = CGRect(x: x, y: y, width: width, height: height)

        // initialize Badge's label
        let label = CATextLayer()
        label.string = badgeLabel.text
        label.alignmentMode = .center
        label.font = badgeLabel.font
        label.fontSize = badgeLabel.font.pointSize

        label.frame = textFrame
        label.foregroundColor = badgeLabel.textColor?.cgColor ?? UIColor.white.cgColor
        label.backgroundColor = UIColor.clear.cgColor
        label.contentsScale = UIScreen.main.scale
        badge.addSublayer(label)

        // save Badge as UIBarButtonItem property
        objc_setAssociatedObject(self, &handle, badge, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)

        // bring layer to front
        badge.zPosition = 1
    }

    func removeBadge() {
        badgeLayer?.removeFromSuperlayer()
    }
}

// MARK: - Utilities

extension CAShapeLayer {
    func drawRoundedRect(rect: CGRect, cornerRadius: CGFloat, andColor color: UIColor) {
        fillColor = color.cgColor
        strokeColor = UIColor.clear.cgColor
        path = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius).cgPath
    }
}

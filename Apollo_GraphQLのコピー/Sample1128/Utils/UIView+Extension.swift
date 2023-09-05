//
//  UIFont+Extended.swift
//  ToyotaWallet
//

import Foundation
import UIKit

extension UIView {
    public enum UIBorderSide {
        case top, bottom, left, right
    }

    // ビューのコーナーを設定する
    func corner(radius: CGFloat, masksToBounds: Bool = true) {
        layer.cornerRadius = radius
        layer.masksToBounds = masksToBounds
    }

    // ビューのサークルを設定する
    func circle() {
        corner(radius: frame.height / 2.0)
    }

    // ビューのグラデーションを設定する
    func gradientLayer(colors: [UIColor], start: CGPoint, end: CGPoint, locations: [NSNumber]? = nil) {
        let layer = CAGradientLayer()
        layer.frame = bounds
        layer.colors = colors.map { $0.cgColor }
        layer.startPoint = start
        layer.endPoint = end
        layer.locations = locations
        self.layer.insertSublayer(layer, at: 0)
    }

    // 幅と色でビューの境界線を設定する
    func border(width: CGFloat, color: UIColor) {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
    }

    // 側面、幅、色でビューの境界線を設定する
    public func addBorder(side: UIBorderSide, color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        switch side {
        case .top:
            border.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: width)
        case .bottom:
            border.frame = CGRect(x: 0, y: frame.size.height - width, width: frame.size.width, height: width)
        case .left:
            border.frame = CGRect(x: 0, y: 0, width: width, height: frame.size.height)
        case .right:
            border.frame = CGRect(x: frame.size.width - width, y: 0, width: width, height: frame.size.height)
        }
        layer.addSublayer(border)
    }

    // ビューの影を設定する
    func dropShadow(color: UIColor = UIColor(red: 0.32, green: 0.32, blue: 0.32, alpha: 1.0),
                    opacity: Float = 0.8,
                    offset: CGSize = .init(width: 2.0, height: 2.0),
                    radius: CGFloat = 2.0,
                    shouldRasterize: Bool = false,
                    path: UIBezierPath? = nil,
                    rasterizationScale: CGFloat? = nil) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        if let path = path?.cgPath {
            layer.shadowPath = path
        }
        layer.shouldRasterize = shouldRasterize
        if let scale = rasterizationScale {
            layer.rasterizationScale = scale
        }
    }

    // ビューの影をリセットする
    func resetDropShadow(color: UIColor = .white,
                         opacity: Float = 0,
                         offset: CGSize = .init(width: 0, height: 0),
                         radius: CGFloat = 0,
                         shouldRasterize: Bool = false,
                         path: UIBezierPath? = nil,
                         rasterizationScale: CGFloat? = nil) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        if let path = path?.cgPath {
            layer.shadowPath = path
        }
        layer.shouldRasterize = shouldRasterize
        if let scale = rasterizationScale {
            layer.rasterizationScale = scale
        }
    }

    /** 同じ名前からインスタンスをロードします. */
    func loadNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nibName = type(of: self).description().components(separatedBy: ".").last!
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView ?? UIView()
    }

}

extension UIView {
    // サブビューリストを追加する
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach(addSubview)
    }

    /// これは特定の型のビューのサブビューを取得するための関数です。
    func subViews<T: UIView>(type: T.Type) -> [T] {
        var all = [T]()
        for view in subviews {
            if let aView = view as? T {
                all.append(aView)
            }
        }
        return all
    }

    /// これは、特定の型のサブビューをビューから再帰的に取得するための関数です。 すべてのサブビューで再帰的に見え、 Type T にサブビューに戻ります
    func allSubViewsOf<T: UIView>(type: T.Type) -> [T] {
        var all = [T]()
        func getSubview(view: UIView) {
            if let aView = view as? T {
                all.append(aView)
            }
            guard !view.subviews.isEmpty else { return }
            view.subviews.forEach { getSubview(view: $0) }
        }
        getSubview(view: self)
        return all
    }
}

extension UIStackView {
    // サブビューをスタックビューに追加する
    func addArrangedSubviews(_ subviews: UIView...) {
        subviews.forEach(addArrangedSubview)
    }
}

extension UIView {
    @IBInspectable var cornerRadius: Double {
        get {
            Double(layer.cornerRadius)
        } set {
            layer.cornerRadius = CGFloat(newValue)
        }
    }

    @IBInspectable var borderWidth: Double {
        get {
            Double(layer.borderWidth)
        }
        set {
            layer.borderWidth = CGFloat(newValue)
        }
    }

    @IBInspectable var borderColor: UIColor? {
        get {
            UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }

    @IBInspectable var shadowColor: UIColor? {
        get {
            UIColor(cgColor: layer.shadowColor!)
        }
        set {
            layer.shadowColor = newValue?.cgColor
        }
    }

    @IBInspectable var shadowOpacity: Float {
        get {
            layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }

    @IBInspectable var isCycle: Bool {
        get {
            false
        }
        // swiftlint:disable:next unused_setter_value
        set {
            layer.cornerRadius = layer.frame.height / 2
        }
    }
}

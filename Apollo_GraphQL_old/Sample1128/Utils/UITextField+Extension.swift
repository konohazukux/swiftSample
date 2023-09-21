import Foundation
import UIKit

extension UITextField {
    /// placeholder文字列と、各種必要なスタイルをセットする
    @IBInspectable var placeholderWithStyles: String? {
        get {
            placeholder
        }
        set {
            guard let newValue = newValue else { return }

            attributedPlaceholder = NSAttributedString(
                string: newValue,
                attributes: [
                    .foregroundColor: Asset.Assets.Colors.middleGray.color
                ]
            )
        }
    }
}

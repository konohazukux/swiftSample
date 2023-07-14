//
//  LottieAnimationView.swift
//  Sample1128
//
//  Created by TAKESHI SHIMADA on 2020/09/09.
//  Copyright © 2020 TAKESHI SHIMADA. All rights reserved.
//

import Lottie
import UIKit

class LottieAnimationView: UIView {
    enum Name {
        case checkmark_red
        case checkmark_blue
        case checkmark_yellow
        case checkmark_pink
        case checkmark_green

        var param: String {
            switch self {
            case .checkmark_red:
                return "checkmark_red"
            case .checkmark_blue:
                return "checkmark_blue"
            case .checkmark_yellow:
                return "checkmark_yellow"
            case .checkmark_pink:
                return "checkmark_pink"
            case .checkmark_green:
                return "checkmark_green"
            }
        }
    }

    let animationView = AnimationView()
    @IBInspectable var animationName: String? {
        didSet {
            animationView.animation = animationName.flatMap {
                Animation.named($0, animationCache: nil)
            }
        }
    }

    var loopMode: LottieLoopMode? {
        didSet {
            animationView.loopMode = loopMode ?? .playOnce
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        set()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        backgroundColor = .clear
        set()
    }

    private func set() {
        animationView.contentMode = .scaleAspectFit
        addSubview(animationView)
        animationView.backgroundBehavior = .pauseAndRestore
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        animationView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        animationView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        animationView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }

    func setup(_ name: String) {
        let animation = Animation.named(name)
        animationView.animation = animation
    }

    func play(complete: @escaping (() -> Void) = {}) {
        animationView.play { _ in
            complete()
        }
    }

    func stop() {
        animationView.stop()
    }
}

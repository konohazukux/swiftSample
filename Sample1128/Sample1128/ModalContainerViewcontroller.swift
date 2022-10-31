//
//  ModalContainerViewcontroller.swift
//

import Foundation
import UIKit

class ModalContainerViewController: UIViewController {
  
    @IBOutlet private weak var stackView: UIStackView!
    @IBOutlet private var topConstraint: NSLayoutConstraint?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.view.backgroundColor = UIColor.init(red: 1, green: 0, blue: 0, alpha: 0.7)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // 下スワイプ
        let downSwipe = UISwipeGestureRecognizer(
            target: self,
            action: #selector(ModalContainerViewController.didSwipe(_:))
        )
        downSwipe.direction = .down
        self.view.addGestureRecognizer(downSwipe)
    }
   
    private weak var _vc: UIViewController?
   
    func set(parent: UIViewController) {
        modalPresentationStyle = .overCurrentContext
        parent.present(self, animated: false)
    }
    
    func set(_ vc: UIViewController, height: CGFloat) {
        self._vc = vc
        addChild(vc)
        
        stackView.addArrangedSubview(vc.view)
        self.loadViewIfNeeded()
    }
    
    func show() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak self] in
            guard let self = self else { return }
            UIView.animate(
                withDuration: 0.2,
                animations: {
                    self.topConstraint?.isActive = false
                    self.view.layoutIfNeeded()
                }, completion: nil)
        }
    }

    func hide() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { [weak self] in
            guard let self = self else { return }
            UIView.animate(
                withDuration: 0.2,
                animations: {
                    self.topConstraint?.isActive = true
                    self.view.layoutIfNeeded()
                }, completion: { _ in
                    self.dismiss(animated: false)
                })
        }
    }
    
    //スワイプ時に実行されるメソッド
    @objc func didSwipe(_ sender: UISwipeGestureRecognizer) {
        //スワイプ方向による実行処理をcase文で指定
        switch sender.direction {
        case .up:
            //上スワイプ時に実行したい処理
            print("111 sdf\(#line) \(type(of: self))  \(#function) : \(self) ")
        case .right:
            //右スワイプ時に実行したい処理
            print("111 sdf\(#line) \(type(of: self))  \(#function) : \(self) ")
        case .down:
            //下スワイプ時に実行したい処理
            print("111 sdf\(#line) \(type(of: self))  \(#function) : \(self) ")
            hide()
        case .left:
            //左スワイプ時に実行したい処理
            print("111 sdf\(#line) \(type(of: self))  \(#function) : \(self) ")
        default:
            break
        }
    }
}

//
//  FirstViewController.swift
//  Sample1128
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet var button: UIButton!

    let notificationToastView = NotificationToastView()
    var bottomConstraint: NSLayoutConstraint? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
            self?.setupView()
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            self?.animate()
        }
    }
   
    func setupView() {
        notificationToastView.frame = CGRect.init(x: 100, y: 100, width: 100, height: 100)
        self.tabBarController?.view.addSubview(notificationToastView)
        
        let parant = self.tabBarController!.view!
        notificationToastView.translatesAutoresizingMaskIntoConstraints = false
        notificationToastView.leadingAnchor.constraint(equalTo: parant.leadingAnchor, constant: 16).isActive = true
        notificationToastView.trailingAnchor.constraint(equalTo: parant.trailingAnchor, constant: -16).isActive = true
        notificationToastView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        self.bottomConstraint = notificationToastView.topAnchor.constraint(equalTo: parant.bottomAnchor, constant: -10)
        
        self.bottomConstraint?.isActive = true
        parant.layoutIfNeeded()
        
    }
    
    private func animate() {
        let parant = self.tabBarController!.view!
        let tabBar = tabBarController?.tabBar

        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseInOut, animations: { [weak self] in
          
            guard let temp = tabBar?.topAnchor
            else { return }

            self?.bottomConstraint?.isActive = false
            self?.notificationToastView.bottomAnchor.constraint(equalTo: temp, constant: -10).isActive = true
            //notificationToastView.center.y += 100.0
            parant.layoutIfNeeded()
        }, completion: nil)
    }
    
}

extension UIView {
    func addToView(parant: UIView) {
        parant.addSubview(self)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: parant.leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: parant.trailingAnchor).isActive = true
        self.topAnchor.constraint(equalTo: parant.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: parant.bottomAnchor).isActive = true
    }
    
    func addGradientLayer(color1: UIColor, color2: UIColor, directionHorizontal: Bool = false) {
       
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        
        gradientLayer.colors = [color1.cgColor, color2.cgColor]

        if directionHorizontal {
            gradientLayer.startPoint = CGPoint.init(x: 0, y: 0.5)
            gradientLayer.endPoint = CGPoint.init(x: 1 , y:0.5 )
        } else {
            gradientLayer.startPoint = CGPoint.init(x: 0.5, y: 0)
            gradientLayer.endPoint = CGPoint.init(x: 0.5 , y:1 )
        }

        self.layer.insertSublayer(gradientLayer,at:0)

    }

    
}

//
//  FirstViewController.swift
//  Sample1128
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet var button: UIButton!

    var bottomConstraint: NSLayoutConstraint? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            guard let self = self else { return }
            self.setupView()
        }
    }
   
    func setupView() {
        guard let tabBarController = tabBarController else { return }
        let notificationToastView = NotificationToastView(tabBarController: tabBarController) {
           print("tapped")
        }
        notificationToastView.show()
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

//
//  FirstViewController.swift
//  Sample1128
//

import UIKit
import RxSwift
import RxCocoa
import Lottie

class FirstViewController: UIViewController {

    let disposeBag = DisposeBag()
    @IBOutlet var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        transition()
    }
   
    func transition() {

        let animationView = AnimationView(name: "GtoP")
        animationView.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        animationView.center = self.view.center
        animationView.loopMode = .playOnce
        animationView.contentMode = .scaleAspectFit
        animationView.animationSpeed = 1

        view.addSubview(animationView)

        animationView.play()
        
    }

}


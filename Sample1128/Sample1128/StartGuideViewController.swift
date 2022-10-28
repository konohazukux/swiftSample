//
//  MissionViewController.swift
//

import Foundation
import UIKit
import FloatingPanel

class StartGuideViewController: UIViewController {

    @IBOutlet weak var titleLabel : UILabel!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
      
        titleLabel.attributedText = "ちっちゃな頃から優等生".attributedString(
            UIColor.red,
            font: UIFont(name: "HiraginoSans-W6", size: 30)!,
            align: NSTextAlignment.left,
            lineSpace: 6,
            kern: 3)
    }
    
    @IBAction func close() {
        self.dismiss(animated: true)
    }
    
    @IBAction func confirmHowToPlay() {

        var fpc: FloatingPanelController!
        fpc = FloatingPanelController()
        fpc.delegate = self // Optional
        let contentVC = StartGuideSelectViewController()
        fpc.set(contentViewController: contentVC)
        fpc.isRemovalInteractionEnabled = true
        fpc.surfaceView.layer.cornerRadius = 16.0
        fpc.surfaceView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        fpc.surfaceView.layer.masksToBounds = true
        present(fpc, animated: true)
        
    }
    
}

extension StartGuideViewController: FloatingPanelControllerDelegate {
    func floatingPanel(_ vc: FloatingPanelController, layoutFor newCollection: UITraitCollection) -> FloatingPanelLayout {
        return FloatingPanelBottomLayout()
    }
}

class FloatingPanelBottomLayout: FloatingPanelLayout {
    
    let position: FloatingPanelPosition = .bottom
    let initialState: FloatingPanelState = .half
    
    var anchors: [FloatingPanelState: FloatingPanelLayoutAnchoring] {
        return [
            .half: FloatingPanelLayoutAnchor(
                absoluteInset: StartGuideSelectView.VIEW_HEIGHT * 2,
                edge: .bottom,
                referenceGuide: .safeArea
            )
        ]
    }
}


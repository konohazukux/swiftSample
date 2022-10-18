//
//  MissionViewController.swift
//

import Foundation
import UIKit
import FloatingPanel

class MissionViewController: UIViewController {

    @IBAction func close() {
        self.dismiss(animated: true)
    }
    
    @IBAction func confirmHowToPlay() {

        var fpc: FloatingPanelController!
        fpc = FloatingPanelController()
        fpc.delegate = self // Optional
        let contentVC = MissionSelectViewController()
        fpc.set(contentViewController: contentVC)
        fpc.isRemovalInteractionEnabled = true
        fpc.surfaceView.layer.cornerRadius = 16.0
        fpc.surfaceView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        fpc.surfaceView.layer.masksToBounds = true
        present(fpc, animated: true)
        
    }
    
}

extension MissionViewController: FloatingPanelControllerDelegate {
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
                absoluteInset: MissionSelectView.VIEW_HEIGHT * 2,
                edge: .bottom,
                referenceGuide: .safeArea
            )
        ]
    }
}


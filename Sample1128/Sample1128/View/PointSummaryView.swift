//
//  PointSummaryView.swift
//  Sample1128
//
//  Created by t shimada on 2020/07/27.
//  Copyright © 2020 TAKESHI SHIMADA. All rights reserved.
//

import Foundation
import UIKit

protocol NibLoaderProtocol where Self: UIView {
    func addNibWithLayout()
}
extension NibLoaderProtocol {
    func addNibWithLayout() {
        if let view = Bundle(for: type(of: self))
            .loadNibNamed(
                String(describing: type(of: self)),
                owner: self, options: nil)?.first as? UIView {
            
            self.addSubview(view)
            view.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            view.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
            view.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
            view.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        }
    }
}

class PointSummaryView: UIView, NibLoaderProtocol {

    @IBOutlet private weak var crdKaiinNo4fLabel: UILabel!
    @IBOutlet private weak var souHoyuPtLabel: UILabel!
    @IBOutlet private weak var zndkLabel: UILabel!
    @IBOutlet private weak var kikanPtKeiLabel: UILabel!
    @IBOutlet private weak var kikanPtButtonView: UIView!
    @IBOutlet private weak var tyokinSikkoYoteiAlertView: UIView!
    @IBOutlet private weak var tyokinSikkoYoteiBiLabel: UILabel!
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        _loadNib()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        _loadNib()
    }

    func _loadNib() {
        addNibWithLayout()
        temp()
    }
    
    func temp() {

        let mallPointRest = GetMallPointRest.init(
            cbFlg: nil, cbKingaku1: nil, cbKingaku2: nil, cbKingaku3: nil, cbKingaku4: nil, cbKingaku5: nil, crdKaiinNo4f: "6373", crdKnrNo: nil, kaiinNo: nil, kikanPtKei: 6374, kikanZndkFree: nil, kikanZndkLtd: nil, kikanZndkLtdAll: nil, kmtKikanPtKei: nil, kmtSouHoyuPt: nil, koukanKanoPt: nil, message: nil, ptYukoKbn: nil, ptYukoKikan: nil, result: nil, seiflgKng: nil, seiflgSyk: nil, souHoyuPt: 5363, syohinId1: nil, syohinId2: nil, syohinId3: nil, syohinId4: nil, syohinId5: nil, tmcScrambleTopsKanriNo: nil, topsKanriNo: nil, tukaId: nil, tyokinSikkoYoteiBi: "2011/11/11", tyokinSikkoYoteiPt: nil, yoteiKikanZndk: nil, zndk: 4673, zndkZeroFlg: nil)
        
        crdKaiinNo4fLabel.text = mallPointRest.crdKaiinNo4f
        souHoyuPtLabel.text = mallPointRest.souHoyuPt.map { String($0) }
        zndkLabel.text = mallPointRest.zndk.map { String($0) }
        kikanPtKeiLabel.text = mallPointRest.kikanPtKei.map { String($0) }
        kikanPtButtonView.isHidden = mallPointRest.kikanPtButtonViewHidden
        tyokinSikkoYoteiAlertView.isHidden = mallPointRest.tyokinSikkoYoteiAlertViewHidden
        tyokinSikkoYoteiBiLabel.text = mallPointRest.tyokinSikkoYoteiBiDateString
        
    }
    
}

extension GetMallPointRest {
    var kikanPtButtonViewHidden: Bool {
        kikanPtKei.map { $0 == 0 } ?? true
    }
    var tyokinSikkoYoteiAlertViewHidden: Bool {
        tyokinSikkoYoteiBi == nil
    }
    var tyokinSikkoYoteiBiDate: Date{
        //TODO: self.tyokinSikkoYoteiBi to date
        return Date()
    }
    var tyokinSikkoYoteiBiDateString: String {
        //TODO: tyokinSikkoYoteiBiDate.toString
        return "2021年4月に" + "に失効するポイントがあります"
    }
    
}

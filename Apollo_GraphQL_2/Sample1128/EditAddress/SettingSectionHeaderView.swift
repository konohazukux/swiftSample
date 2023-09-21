//
//  SettingSectionHeaderView.swift
//  SegaPlato
//
//  Created by TAKESHI SHIMADA on 2021/09/23.
//

import UIKit

class SettingSectionHeaderView: UITableViewHeaderFooterView {
    @IBOutlet private weak var view: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
    }

    func setup(title: String) {
        titleLabel.text = title
    }
}


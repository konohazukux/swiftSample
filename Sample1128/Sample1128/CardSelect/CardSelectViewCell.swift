//
//  CardSelectCell.swift
//  Sample1128
//

import UIKit

class CardSelectViewCell: UITableViewCell {

    @IBOutlet private weak var cardImageView: UIImageView!
    @IBOutlet private weak var cardNumLabel: UILabel!
    @IBOutlet private weak var cardTermLabel: UILabel!

    func update(model: CardSelectViewModel.CardModel) {

//        cardImageView.
        cardNumLabel.text = model.numStr
        cardTermLabel.text = model.term
        self.accessoryType = model.isSelect ? .checkmark : .none
    }
}

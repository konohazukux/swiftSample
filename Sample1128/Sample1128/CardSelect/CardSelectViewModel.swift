//
//  CardSelectViewModel.swift
//  Sample1128
//
//  Created by TAKESHI SHIMADA on 2021/10/21.
//  Copyright © 2021 TAKESHI SHIMADA. All rights reserved.
//

import Foundation
import RxSwift
import RxRelay

class CardSelectViewModel {

    enum CellType {
        case card(CardModel)
        case add
        case help
    }

    struct CardModel {
        let numStr: String
        let term: String
        let imageURL: String
    }
    
    let cardsRelay = BehaviorRelay<[CellType]>.init(value: [])
    
    func getCardInfo() {
       
        let numStr = "xxxxxxx xxxx 2345"
        let term = "xx/xx"
        let imageURL = "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5a/Visa_2014.svg/200px-Visa_2014.svg.png"
        

        let cards = [
            CellType.card(CardModel(numStr: numStr, term: term, imageURL: imageURL)),
            CellType.card(CardModel(numStr: numStr, term: term, imageURL: imageURL)),
            CellType.card(CardModel(numStr: numStr, term: term, imageURL: imageURL)),
            CellType.card(CardModel(numStr: numStr, term: term, imageURL: imageURL)),
            CellType.add,
            CellType.help
        ]
        
        cardsRelay.accept(cards)
    }
    
}

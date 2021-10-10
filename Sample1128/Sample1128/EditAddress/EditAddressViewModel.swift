//
//  EditAddressViewModel.swift
//  Sample1128
//
//  Created by TAKESHI SHIMADA on 2021/10/09.
//  Copyright © 2021 TAKESHI SHIMADA. All rights reserved.
//

import Foundation
import RxSwift
import RxRelay

class EditAddressViewModel {

    var addressInfoTypesRelay = BehaviorRelay<[AddressInfoType]>(value: [])

    init() {
        bind()
    }
    
    private func bind() {
        addressInfoTypesRelay.accept(AddressInfoType.allCases)
    }

    enum AddressInfoType: CaseIterable {
        case space1
        case familyName
        case givenName
        case familyNameKana
        case givenNameKane
        case space2
        case zipCode
        case prefecture
        case address1
        case address2
        case address3
        case space3
        case tel
        
        var title: String {
            switch self {
            case .space1:
                return ""
            case .familyName:
                return "姓（全角）"
            case .givenName:
                return "名（全角）"
            case .familyNameKana:
                return "姓カナ（全角）"
            case .givenNameKane:
                return "名カナ（全角）"
            case .space2:
                return ""
            case .zipCode:
                return "郵便番号（数字）"
            case .prefecture:
                return "都道府県"
            case .address1:
                return "市区町村"
            case .address2:
                return "番地"
            case .address3:
                return "建物名(任意)"
            case .space3:
                return ""
            case .tel:
                return "電話番号"
            }
        }
        var placeHolder: String {
            switch self {
            case .space1:
                return ""
            case .familyName:
                return "例）田中"
            case .givenName:
                return "例）彩"
            case .familyNameKana:
                return "例）タナカ"
            case .givenNameKane:
                return "例）アヤ"
            case .space2:
                return ""
            case .zipCode:
                return "例）1234567"
            case .prefecture:
                return "選択してください"
            case .address1:
                return "例）横浜市青葉区"
            case .address2:
                return "例）青山1-1-1"
            case .address3:
                return "例）柳ビル 102"
            case .space3:
                return ""
            case .tel:
                return "例）09012345678"
            }
        }
        
        var isSpace: Bool {
            switch self {
            case .space1, .space2, .space3:
                return true
            default:
                return false
            }
        }
        
        var isTop: Bool {
            switch self {
            case .familyName, .zipCode, .tel:
                return true
            default:
                return false
            }
        }
        
        var isBottom: Bool {
            switch self {
            case .givenNameKane, .address3, .tel:
                return true
            default:
                return false
            }
        }

    }
}

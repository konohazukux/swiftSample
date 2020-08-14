//
//  FirstViewController.swift
//  Sample1128
//
//  Created by TAKESHI SHIMADA on 2019/11/28.
//  Copyright © 2019 TAKESHI SHIMADA. All rights reserved.
//

import UIKit
import SafariServices
import RxSwift
import RxCocoa
import SwiftDate

class FirstViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var phoneTf: UITextField!
    @IBOutlet weak var oneButton: UIButton!
    private var myButton: UIButton!
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        show()
    }
    
    func show() {
        
        let storyboard = UIStoryboard.init(name: "UsageLimited", bundle: nil)
        guard let viewController = storyboard.instantiateInitialViewController() as? UsageLimitedVC else { return }
       
        
        present(viewController, animated: true, completion: nil)
        

    }
    
    func genGetMallCardsContract() -> GetMallCardsContract {
        

        let b01 = GetMallCardsContract.B01.init(cardCnt: 3)
        
        let b02 = GetMallCardsContract.B02.init(
            bnsPayMax: 4324,
            bnsPayRiyoKanoGaku: 32432,
            bnsPayZndk: 43243,
            cardCd: "test-1",
            cardNm: "test-1",
            cardYukTrm: "test-1",
            clBnsMon1: "test-1",
            clBnsMon2: "test-1",
            clBnsRepayGaku: 322,
            clIntrt: 234,
            clMax: 432,
            clRepaymtdnm: "test-1",
            clRiyoKanoGaku: 432,
            clZndk: 432,
            crdKaiinNo4f: "test-1",
            csIntrt: 532,
            csMax: 532,
            csRiyoKanoGaku: 23,
            csZndk: 432,
            exarslt: "test-1",
            foreignCsMax: 423,
            foreignCsRiyoKanoGaku: 42,
            foreignCsZndk: 4243,
            instllmtpayMax: 423432,
            instllmtpayRiyoKanoGaku: 432423,
            instllmtpayZndk: 4324,
            payDate: "test-1",
            payKzBnkName: "test-1",
            payKzBnkStName: "test-1",
            payKzItemName: "test-1",
            payKzNm: "test-1",
            payKzNo: "test-1",
            riboBnsMon1: "test-1",
            riboBnsMon2: "test-1",
            riboBnsRepayGaku: 4324,
            riboIntrt: 432423,
            riboMax: 432423,
            riboRepaymtdnm: "test-1",
            riboRiyoKanoGaku: 42342,
            riboZndk: 423423,
            shopMax: 42342,
            shopRiyoKanoGaku: 4234,
            shopZndk: 42342
        )
        
       let b03 = GetMallCardsContract.B03.init(
            authoriReservationTekiCd: "test-3",
            authoriReservationTrm: "test-3",
            bnsReservationLimit: 657,
            csReservationLimit: 76568,
            cusBnsRiyoKanoGaku: 8658,
            cusBnsRiyoLmt: 86585,
            cusBnsRiyoZndk: 86585,
            cusClRiyoKanoGaku: 86585,
            cusClRiyoLmt: 86585,
            cusClRiyoZndk: 86585,
            cusCsRiyoKanoGaku: 86585,
            cusCsRiyoLmt: 86585,
            cusCsRiyoZndk: 865865,
            cusForeignCsRiyoKanoGaku: 65865,
            cusForeignCsRiyoLmt: 8658,
            cusForeignCsRiyoZndk: 8568,
            cusInstllmtpayRiyoKanoGaku: 86585,
            cusInstllmtpayRiyoLmt: 85685,
            cusInstllmtpayRiyoZndk: 85865,
            cusRiboRiyoKanoGaku: 85865,
            cusRiboRiyoLmt: 86585,
            cusRiboRiyoZndk: 865865,
            cusShopRiyoKanoGaku: 865865,
            cusShopRiyoLmt: 86585,
            cusShopRiyoZndk: 86585,
            foreignCsReservationLimit: 85685,
            instllmtpayReservationLimit: 856865,
            riboReservationLimit: 865865,
            shopReservationLimit: 856865
        )
        

        
        let mallCardsContract = GetMallCardsContract.init(
            b01: b01,
            b02: [b02],
            b03: b03,
            message: "message-1",
            result: "result-1"
        )
       
        return mallCardsContract
        
    }

}





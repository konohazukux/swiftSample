//
//  UsageLimitedVC.swift
//  ToyotaWallet
//
//  Created by t shimada on 2020/07/29.
//

import RxCocoa
import RxSwift
import UIKit

final class UsageLimitedVC: UIViewController {

    // 契約状況照会
    @IBOutlet weak var shopMaxLabel: UILabel!
    @IBOutlet weak var shopZndkLabel: UILabel!
    @IBOutlet weak var shopRiyoKanoGakuLabel: UILabel!
    @IBOutlet weak var riboIntrtLabel: UILabel!
    @IBOutlet weak var riboMaxLabel: UILabel!
    @IBOutlet weak var riboZndkLabel: UILabel!
    @IBOutlet weak var riboRiyoKanoGakuLabel: UILabel!
    @IBOutlet weak var instllmtpayMaxLabel: UILabel!
    @IBOutlet weak var instllmtpayZndkLabel: UILabel!
    @IBOutlet weak var instllmtpayRiyoKanoGakuLabel: UILabel!
    @IBOutlet weak var csIntrtLabel: UILabel!
    @IBOutlet weak var csMaxLabel: UILabel!
    @IBOutlet weak var csZndkLabel: UILabel!
    @IBOutlet weak var csRiyoKanoGakuLabel: UILabel!
    @IBOutlet weak var clIntrtLabel: UILabel!
    @IBOutlet weak var clMaxLabel: UILabel!
    @IBOutlet weak var clZndkLabel: UILabel!
    @IBOutlet weak var clRiyoKanoGakuLabel: UILabel!

    // お客様の合計利用可能枠
    @IBOutlet weak var cusShopRiyoLmtLabel: UILabel!
    @IBOutlet weak var cusShopRiyoZndkLabel: UILabel!
    @IBOutlet weak var cusShopRiyoKanoGakuLabel: UILabel!
    @IBOutlet weak var cusRiboRiyoLmtLabel: UILabel!
    @IBOutlet weak var cusRiboRiyoZndkLabel: UILabel!
    @IBOutlet weak var cusRiboRiyoKanoGakuLabel: UILabel!
    @IBOutlet weak var cusInstllmtpayRiyoLmtLabel: UILabel!
    @IBOutlet weak var cusInstllmtpayRiyoZndkLabel: UILabel!
    @IBOutlet weak var cusInstllmtpayRiyoKanoGakuLabel: UILabel!
    @IBOutlet weak var cusCsRiyoLmtLabel: UILabel!
    @IBOutlet weak var cusCsRiyoZndkLabel: UILabel!
    @IBOutlet weak var cusCsRiyoKanoGakuLabel: UILabel!
    @IBOutlet weak var cusClRiyoLmtLabel: UILabel!
    @IBOutlet weak var cusClRiyoZndkLabel: UILabel!
    @IBOutlet weak var cusClRiyoKanoGakuLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        let mallCardsContract = genGetMallCardsContract()
        set(mallCardsContract)
    }
    
    func set(_ mallCardsContract: GetMallCardsContract) {
       
        guard let b02 = mallCardsContract.b02?.first else { return }
        guard let b03 = mallCardsContract.b03 else { return }
       
        // b02
        shopMaxLabel.text = convertYenLetter(b02.shopMax)
        shopZndkLabel.text = convertYenLetter(b02.shopZndk)
        shopRiyoKanoGakuLabel.text = convertYenLetter(b02.shopRiyoKanoGaku)
        riboIntrtLabel.text = convertPercentLetter(b02.riboIntrt)
        riboMaxLabel.text = convertYenLetter(b02.riboMax)
        riboZndkLabel.text = convertYenLetter(b02.riboZndk)
        riboRiyoKanoGakuLabel.text = convertYenLetter(b02.riboRiyoKanoGaku)
        instllmtpayMaxLabel.text = convertYenLetter(b02.instllmtpayMax)
        instllmtpayZndkLabel.text = convertYenLetter(b02.instllmtpayZndk)
        instllmtpayRiyoKanoGakuLabel.text = convertYenLetter(b02.instllmtpayRiyoKanoGaku)
        csIntrtLabel.text = convertPercentLetter(b02.csIntrt)
        csMaxLabel.text = convertYenLetter(b02.csMax)
        csZndkLabel.text = convertYenLetter(b02.csZndk)
        csRiyoKanoGakuLabel.text = convertYenLetter(b02.csRiyoKanoGaku)
        clIntrtLabel.text = convertPercentLetter(b02.clIntrt)
        clMaxLabel.text = convertYenLetter(b02.clMax)
        clZndkLabel.text = convertYenLetter(b02.clZndk)
        clRiyoKanoGakuLabel.text = convertYenLetter(b02.clRiyoKanoGaku)
        
        // b03
        cusShopRiyoLmtLabel.text = convertYenLetter(b03.cusShopRiyoLmt)
        cusShopRiyoZndkLabel.text = convertYenLetter(b03.cusShopRiyoZndk)
        cusShopRiyoKanoGakuLabel.text = convertYenLetter(b03.cusShopRiyoKanoGaku)
        cusRiboRiyoLmtLabel.text = convertYenLetter(b03.cusRiboRiyoLmt)
        cusRiboRiyoZndkLabel.text = convertYenLetter(b03.cusRiboRiyoZndk)
        cusRiboRiyoKanoGakuLabel.text = convertYenLetter(b03.cusRiboRiyoKanoGaku)
        cusInstllmtpayRiyoLmtLabel.text = convertYenLetter(b03.cusInstllmtpayRiyoLmt)
        cusInstllmtpayRiyoZndkLabel.text = convertYenLetter(b03.cusInstllmtpayRiyoZndk)
        cusInstllmtpayRiyoKanoGakuLabel.text = convertYenLetter(b03.cusInstllmtpayRiyoKanoGaku)
        cusCsRiyoLmtLabel.text = convertYenLetter(b03.cusCsRiyoLmt)
        cusCsRiyoZndkLabel.text = convertYenLetter(b03.cusCsRiyoZndk)
        cusCsRiyoKanoGakuLabel.text = convertYenLetter(b03.cusCsRiyoKanoGaku)
        cusClRiyoLmtLabel.text = convertYenLetter(b03.cusClRiyoLmt)
        cusClRiyoZndkLabel.text = convertYenLetter(b03.cusClRiyoZndk)
        cusClRiyoKanoGakuLabel.text = convertYenLetter(b03.cusClRiyoKanoGaku)

        
    }
    
  
    private func convertYenLetter(_ val: Int?) -> String? {
        convertYenLetter(val.map { String($0) })
    }
    private func convertYenLetter(_ str: String?) -> String? {
        str.map { String($0).currencyInputFormatting() + "円" }
    }
    private func convertPercentLetter(_ val: Int?) -> String? {
        convertPercentLetter(val.map { String($0) })
    }
    private func convertPercentLetter(_ str: String?) -> String? {
        str.map { String($0).currencyInputFormatting() + "円" }
    }
    
    

    
    func genGetMallCardsContract() -> GetMallCardsContract {
        let b01 = GetMallCardsContract.B01.init(cardCnt: 3)
        let b02 = GetMallCardsContract.B02.init(
            bnsPayMax: 12345,
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
            shopMax: 123456,
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

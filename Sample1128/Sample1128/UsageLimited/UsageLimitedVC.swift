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
            bnsPayMax: 10000,
            bnsPayRiyoKanoGaku: 10001,
            bnsPayZndk: 10002,
            cardCd: "cardCd-1",
            cardNm: "cardNm-1",
            cardYukTrm: "cardYukTrm-1",
            clBnsMon1: "clBnsMon1-1",
            clBnsMon2: "clBnsMon2-1",
            clBnsRepayGaku: 10003,
            clIntrt: 10004,
            clMax: 10005,
            clRepaymtdnm: "clRepaymtdnm-1",
            clRiyoKanoGaku: 10006,
            clZndk: 10007,
            crdKaiinNo4f: "crdKaiinNo4f-1",
            csIntrt: 10008,
            csMax: 10009,
            csRiyoKanoGaku: 10010,
            csZndk: 10011,
            exarslt: "exarslt-1",
            foreignCsMax: 10012,
            foreignCsRiyoKanoGaku: 10013,
            foreignCsZndk: 10014,
            instllmtpayMax: 10015,
            instllmtpayRiyoKanoGaku: 10016,
            instllmtpayZndk: 10017,
            payDate: "payDate-1",
            payKzBnkName: "payKzBnkName-1",
            payKzBnkStName: "payKzBnkStName-1",
            payKzItemName: "payKzItemName-1",
            payKzNm: "tespayKzNmt-1",
            payKzNo: "payKzNo-1",
            riboBnsMon1: "riboBnsMon1-1",
            riboBnsMon2: "riboBnsMon2-1",
            riboBnsRepayGaku: 10018,
            riboIntrt: 10019,
            riboMax: 10020,
            riboRepaymtdnm: "riboRepaymtdnm-1",
            riboRiyoKanoGaku: 10021,
            riboZndk: 10022,
            shopMax: 10023,
            shopRiyoKanoGaku: 10024,
            shopZndk: 10025
        )
        
       let b03 = GetMallCardsContract.B03.init(
            authoriReservationTekiCd: "authoriReservationTekiCd-3",
            authoriReservationTrm: "authoriReservationTrm-3",
            bnsReservationLimit: 20001,
            csReservationLimit: 20002,
            cusBnsRiyoKanoGaku: 20003,
            cusBnsRiyoLmt: 20004,
            cusBnsRiyoZndk: 20005,
            cusClRiyoKanoGaku: 20006,
            cusClRiyoLmt: 20007,
            cusClRiyoZndk: 20008,
            cusCsRiyoKanoGaku: 20009,
            cusCsRiyoLmt: 20010,
            cusCsRiyoZndk: 20011,
            cusForeignCsRiyoKanoGaku: 20012,
            cusForeignCsRiyoLmt: 20013,
            cusForeignCsRiyoZndk: 20014,
            cusInstllmtpayRiyoKanoGaku: 20015,
            cusInstllmtpayRiyoLmt: 20016,
            cusInstllmtpayRiyoZndk: 20017,
            cusRiboRiyoKanoGaku: 20018,
            cusRiboRiyoLmt: 20019,
            cusRiboRiyoZndk: 20020,
            cusShopRiyoKanoGaku: 20021,
            cusShopRiyoLmt: 20022,
            cusShopRiyoZndk: 20023,
            foreignCsReservationLimit: 20024,
            instllmtpayReservationLimit: 20025,
            riboReservationLimit: 20026,
            shopReservationLimit: 20027
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

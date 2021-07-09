//
//  SettingViewController.swift
//  Sample1128
//
//  Created by TAKESHI SHIMADA on 2021/07/09.
//  Copyright © 2021 TAKESHI SHIMADA. All rights reserved.
//

import UIKit

enum SettingType: Int, CaseIterable {
    /// ID・パスワード管理
    case Account = 0
    /// ICカード登録管理
    case Nfc
    /// SEGA ID 紐付け管理
    case SegaId
    /// マイデータ
    case MyData
    /// ランキング
    case Ranking
    /// ゲーム大会
    case Game
    
    /// 初めてガイド
    case FirstGuide
    /// 利用ガイド
    case UsageGuide
    /// 利用店舗一覧
    case MenuArcades
  
    /// お問い合わせ
    case QA
    /// 利用規約
    case Terms
    /// プライバシーポリシー
    case Policy
    /// 特定商取引法
    case Shoho
    /// サービス退会
    case Delete
    
    /// ログアウト
    case Logout

    var cellType: CellType {
        switch self {
        case .Account, .Nfc, .SegaId:
            return .SettingLargeCell
        default:
            return .SettingNomalCell
        }
    }
    var title: String {
        switch self {
        case .Account:
            return "ID・パスワード管理"
        case .Nfc:
            return "ICカード登録管理"
        case .SegaId:
            return "SEGA ID 紐付け管理"
        case .MyData:
            return "マイデータ"
        case .Ranking:
            return "ランキング"
        case .Game:
            return "ゲーム大会"
            
        case .FirstGuide:
            return "初めてガイド"
        case .UsageGuide:
            return "利用ガイド"
        case .MenuArcades:
            return "利用店舗一覧会"
        case .QA:
            return "お問い合わせ"
        case .Terms:
            return "利用規約"
        case .Policy:
            return "プライバシーポリシー"
        case .Shoho:
            return "特定商取引法"
        case .Delete:
            return "サービス退会"
        case .Logout:
            return "ログアウト"

        default:
            return "etc"
        }
    }
    
    enum CellType: String {
        case SettingLargeCell
        case SettingNomalCell
   
        var cellIdentifier: String {
            self.rawValue
        }

        var cellHeight: CGFloat {
            switch self {
            case .SettingLargeCell:
                return 60.0
            case .SettingNomalCell:
                return 48.0
            }
        }
    }
}

class SettingViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().layer.borderWidth = 0.5
        UITabBar.appearance().layer.borderColor = UIColor.clear.cgColor
        UITabBar.appearance().clipsToBounds = true
        
        view.backgroundColor = UIColor.red
        tableView.rowHeight =  UITableView.automaticDimension

        let settingTypes:[[SettingType]] = [
            [.Account, .Nfc, .SegaId, .MyData, .Ranking, .Game],
            [.FirstGuide, .UsageGuide, .MenuArcades],
            [.QA, .Terms, .Policy, .Shoho, .Delete],
        ]

    }
    
   
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
   
}

extension SettingViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return " "
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SettingType.allCases.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let settingType = SettingType(rawValue: indexPath.row) {
            let cellIdentifier = settingType.cellType.cellIdentifier
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
            if let cell = cell as? SettingLargeCell {
                cell.titleLabel.text = SettingType(rawValue: indexPath.row)?.title
                return cell
            } else if let cell = cell as? SettingNomalCell {
                cell.titleLabel.text = SettingType(rawValue: indexPath.row)?.title
                return cell
            }
        }
        print("111 sdfinfolog-\(#line)   \(#function) : \(indexPath.row) ")
        return UITableViewCell()
    }

}

extension SettingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("111 sdfinfolog-\(#line) \(type(of: self))  \(#function) : \(self) ")
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return SettingType(rawValue: indexPath.row)?.cellType.cellHeight ?? 0
//        return UITableView.automaticDimension
    }
}


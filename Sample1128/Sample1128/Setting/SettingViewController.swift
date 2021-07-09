//
//  SettingViewController.swift
//  Sample1128
//
//  Created by TAKESHI SHIMADA on 2021/07/09.
//  Copyright © 2021 TAKESHI SHIMADA. All rights reserved.
//

import UIKit

enum SettingType: Int, CaseIterable {
    case IDPass = 0
    case ICCard
    case segaId
    case myData

    var cellType: CellType {
        switch self {
        case .IDPass, .ICCard, .segaId:
            return .SettingLargeCell
        default:
            return .SettingNomalCell
        }
    }
    var title: String {
        switch self {
        case .IDPass:
            return "ID/pass 管理"
        case .ICCard:
            return "ICカード登録管理"
        case .segaId:
            return "sega id"
        case .myData:
            return "マイデータ"
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
        

    }
    
   
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
   
}

extension SettingViewController: UITableViewDataSource {
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


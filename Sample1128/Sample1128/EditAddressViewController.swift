//
//  SettingViewController.swift
//  Sample1128
//

import UIKit
import RxSwift
import Reusable

class SettingViewController: UIViewController, StoryboardBased {

    @IBOutlet weak var tableView: UITableView!

    private var viewModel: SettingViewModel!
    private let disposeBag = DisposeBag()
    private var settingTypes = [[SettingType]]()

    func inject(viewModel: SettingViewModel) {
        self.viewModel = viewModel
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().layer.borderWidth = 0.5
        UITabBar.appearance().layer.borderColor = UIColor.clear.cgColor
        UITabBar.appearance().clipsToBounds = true
     
        // section header
        let nib = UINib(nibName: "SettingSectionHeaderView", bundle: nil)
        tableView.register(nib, forHeaderFooterViewReuseIdentifier: "SettingSectionHeaderView")
        title = "その他"
        
        tableView.rowHeight =  UITableView.automaticDimension
        
        bind()
    }
    private func bind() {
        rx.viewDidAppear
            .subscribe(onNext: { [unowned self] _ in
                self.viewModel.viewDidAppear()
            })
            .disposed(by: disposeBag)

        viewModel.output.settingTypesRelay
            .asDriver()
            .drive(onNext: { [unowned self] in
                self.settingTypes = $0
                self.tableView.reloadData()
            })
            .disposed(by: disposeBag)
    }
    private func settingTypeFrom(indexPath: IndexPath) -> SettingType {
        settingTypes[indexPath.section][indexPath.row]
    }
  
    private func logout() {
        LoginStatusUtility.deleteLoginUserInfo()
        (UIApplication.shared.delegate as? AppDelegate)?.model.switchRoot(type: .login)
    }
}

extension SettingViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return settingTypes.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (settingTypes[safe: section] ?? []).count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let settingType = settingTypeFrom(indexPath: indexPath)
        let cellIdentifier = settingType.cellType.cellIdentifier
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        if let cell = cell as? SettingLargeCell {
            cell.titleLabel.text = settingType.title
            cell.iconImageView.image = settingType.iconImage
        } else if let cell = cell as? SettingNomalCell {
            cell.titleLabel.text = settingType.title
        } else if let cell = cell as? SettingLogoutCell {
            cell.versionLabel.text = settingType.versionString
        }
        return cell
    }
}


extension SettingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return SectionType(rawValue: section)?.sectionHeight ?? 0
    }

    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor(named: "102-102-102")
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "SettingSectionHeaderView")
        if let headerView = view as? SettingSectionHeaderView {
            let type = SectionType(rawValue: section)
            headerView.setup(title: type?.title ?? "")
        }
        return view
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        let settingType = settingTypeFrom(indexPath: indexPath)
       
        if settingType == .Logout {
            MessageAlertUtility
                .dialog(title: LocalizedString("titleLogout"), message: LocalizedString("messageLogout"))
                .addButton(LocalizedString("yes")) {action in
                    self.logout()
                }
                .addCancel(LocalizedString("no"))
                .show(self)
            return
        }
        
        let viewController = settingType.getViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return settingTypeFrom(indexPath: indexPath).cellHeight
        //return UITableView.automaticDimension
    }
}

extension SettingViewController {
    static func configure() -> UINavigationController {
        let navigationController = UINavigationController().then {
            let viewController = SettingViewController.instantiate()
            viewController.inject(viewModel: SettingViewModel())
            $0.viewControllers = [viewController]
            $0.tabBarItem.title = "その他"
            $0.tabBarItem.image = Asset.Icon.iconTabSetting.image
            $0.tabBarItem.imageInsets =  UIEdgeInsets(top: 23, left: 0, bottom: 23, right: 0)
        }
        return navigationController
    }
}

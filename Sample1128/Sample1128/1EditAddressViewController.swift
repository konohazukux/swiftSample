//
//  Top2ViewController.swift
//  Sample1128
//
//  Created by TAKESHI SHIMADA on 2021/09/03.
//  Copyright © 2021 TAKESHI SHIMADA. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class EditAddressViewController: UIViewController {
  
    @IBOutlet private weak var scrollView: UIScrollView!

    //private var viewModel: EditAddressViewModel!
    private let disposeBag = DisposeBag()
    

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        fatalError("init(coder:) has not been implemented")
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "EditAddress"
        bind()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func bind() {
//        subBannerButton.rx.tap
//            .asDriver()
//            .drive(onNext: { [unowned self] in
//                if let url = self.subBannerUrlString {
//                    self.viewModel.routeToSafari(urlString: url)
//                }
//            })
//            .disposed(by: disposeBag)
    }


//    private func handleError(err: ErrorModel) {
//        ErrorMessageManager
//            .errorDialog(title: err.title, message: err.message)
//            .show(self)
//    }
}

extension EditAddressViewController {
//    static func configure() -> EditAddressViewController {
//        let controller = EditAddressViewController()
//        let viewModel = EditAddressViewModel(
//            repository: PopupsRepository(),
//            router: EditAddressRouter.init(viewController: controller)
//        )
//        controller.viewModel = viewModel
//        return controller
//    }
}

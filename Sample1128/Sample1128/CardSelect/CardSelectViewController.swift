//
//  CardSelectViewController.swift
//  Sample1128
//

import UIKit
import RxSwift

class CardSelectViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var tableViewHeight: NSLayoutConstraint!

    let CardSelectViewCellIdentifire = "CardSelectViewCell"
    let CardAddViewCellIdentifire = "CardAddViewCell"
    let CardSelectHelpCellIdentifire = "CardSelectHelpCell"
   
    private let disposeBag = DisposeBag()
    private let viewModel = CardSelectViewModel()
    private var cards: [CardSelectViewModel.CellType] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: CardSelectViewCellIdentifire, bundle: nil), forCellReuseIdentifier: CardSelectViewCellIdentifire)
        tableView.register(UINib(nibName: CardAddViewCellIdentifire, bundle: nil), forCellReuseIdentifier: CardAddViewCellIdentifire)
        tableView.register(UINib(nibName: CardSelectHelpCellIdentifire, bundle: nil), forCellReuseIdentifier: CardSelectHelpCellIdentifire)

        bind()
        viewModel.getCardInfo()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableViewHeight.constant = CGFloat(tableView.contentSize.height)
    }
    
    func bind(){
        viewModel.cardsRelay
            .asDriver()
            .drive{ [unowned self] in
                cards = $0
                tableView.reloadData()
            }
            .disposed(by: disposeBag)
    }
}
extension CardSelectViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("111 sdf\(#line) \(type(of: self))  \(#function) : \(self) ")
        return cards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("111 sdf\(#line) \(type(of: self))  \(#function) : \(self) ")
        let cellType = cards[indexPath.row] //todo safe
        var cell: UITableViewCell?
        switch cellType {
        case .card(let model):
            cell = tableView.dequeueReusableCell(withIdentifier: CardSelectViewCellIdentifire, for: indexPath) as? CardSelectViewCell
            cell?.accessoryType = .checkmark
        case .add:
            cell = tableView.dequeueReusableCell(withIdentifier: CardAddViewCellIdentifire, for: indexPath) as? CardAddViewCell
        case .help:
            cell = tableView.dequeueReusableCell(withIdentifier: CardSelectHelpCellIdentifire, for: indexPath) as? CardSelectHelpCell
        }
        if let cell = cell {
            return cell
        }
        return UITableViewCell()
    }
    
}

extension CardSelectViewController: UITableViewDelegate {
}

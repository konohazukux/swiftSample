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

        tableView.isEditing = true
        
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
        return cards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = cards[indexPath.row] //todo safe
        let cell = tableView.dequeueReusableCell(withIdentifier: cellType.cellIdentifire, for: indexPath)
        if let cell = cell as? CardSelectViewCell, let model = cellType.model {
            cell.update(model: model)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        cards.remove(at: indexPath.row)
        
//        let height = tableViewHeight.constant
//        UIView.animate(withDuration: 2.0, animations: { [weak self] in
//            self?.tableViewHeight.constant = height
//        }, completion: { [weak self] _ in
//            self?.tableViewHeight.constant = height - 55
//        })
        tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.left)
        
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        let cellType = cards[indexPath.row] //todo safe
        return cellType.isCard ? .delete : .none
    }
    // 編集モード 並べ替え抑制
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return false
    }
}

extension CardSelectViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellType = cards[indexPath.row] //todo safe
        return cellType.cellHeight
    }
}

//
//  Marketplace.swift
//  MapApp
//

import Foundation

// 値オブジェクトであるMarketplaceID
struct MarketplaceID {
    /// 市場ID
    let id: UUID
    /// 市場IDの文字列表現
    var description: String {
        return id.uuidString
    }
  
  /// 文字列で表された市場IDを引数に取り、そのIDがこのインスタンスのIDと等しいかどうかを返す関数。
  /// - Parameter idString: 比較対象の市場IDを表す文字列
  /// - Returns: 与えられた文字列がこのインスタンスのIDと等しい場合は`true`、そうでなければ`false`を返します。
  func isEqualTo(idString: String) -> Bool {
      return UUID(uuidString: idString) == id
  }
  
}

// 市場
class Marketplace {
    /// 市場ID (読み取り専用)
    let id: String
    /// 事業所ID
    var companyID: String
    /// 送客先ID
    var destinationID: String
    /// 市場種別
    var type: MarketplaceType
    /// 訪問履歴表示可否
    var isVisitHistoryVisible: Bool
    /// 稼働ステータス
    var status: OperationStatus
    
    init(id: String, companyID: String, destinationID: String, type: MarketplaceType, isVisitHistoryVisible: Bool, status: OperationStatus) {
        self.id = id
        self.companyID = companyID
        self.destinationID = destinationID
        self.type = type
        self.isVisitHistoryVisible = isVisitHistoryVisible
        self.status = status
    }
    
    /// 引数で渡された市場ID文字列が、このインスタンスの市場IDと等しいかを判断します。
    /// - Parameter idString: 比較対象の市場IDを表す文字列
    /// - Returns: 与えられた市場ID文字列がこのインスタンスの市場IDと等しい場合は`true`、そうでなければ`false`を返します。
    func isEqualToMarketplaceID(idString: String) -> Bool {
        return self.id == idString
    }
  
  // 送客先IDを変更する
    func changeDestinationID(to newDestinationID: String) {
        self.destinationID = newDestinationID
    }
    
    // 市場種別を変更する
    func changeMarketplaceType(to newType: MarketplaceType) {
        self.type = newType
    }
    
    // 訪問履歴の表示可否を変更する
    func changeVisitHistoryVisibility(to isVisible: Bool) {
        self.isVisitHistoryVisible = isVisible
    }
    
    // 稼働を開始する
    func startOperation() {
        self.status = .processing
    }
    
    // 稼働を終了する
    func stopOperation() {
        self.status = .finished
    }
}

// 列挙型であるMarketplaceType
enum MarketplaceType {
    /// 補充
    case refill
    /// 新規オープン
    case newOpen
    /// 分割
    case split
}

// 列挙型であるOperationStatus
enum OperationStatus {
    /// 準備前
    case before
    /// 処理中
    case processing
    /// 処理完了
    case finished
}

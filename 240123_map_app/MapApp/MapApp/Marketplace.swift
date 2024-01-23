//
//  Marketplace.swift
//  MapApp
//


import Foundation

// 値オブジェクトであるMarketplaceID
struct MarketplaceID {
    let id: UUID
    var isValid: Bool {
        // 実際のバリデーションロジックをここに実装する
        // 例えばUUIDのフォーマットが正しいかチェックするなど
        return true
    }
    var isTemporary: Bool {
        // 一時的なIDかどうかのバリデーションロジックを実装する
        return false
    }
    var description: String {
        // UUIDをStringで表現する
        return id.uuidString
    }
}

// エンティティであるMarketplace
class Marketplace {
    let id: MarketplaceID // 読み取り専用
    var companyID: String
    var storeID: String
    var registerID: String
    var isRegisterClosed: Bool
    var operationStatus: OperationStatus

    init(id: MarketplaceID, companyID: String, storeID: String, registerID: String, isRegisterClosed: Bool, operationStatus: OperationStatus) {
        self.id = id
        self.companyID = companyID
        self.storeID = storeID
        self.registerID = registerID
        self.isRegisterClosed = isRegisterClosed
        self.operationStatus = operationStatus
    }

    func updateOperationStatus(newStatus: OperationStatus) {
        // 操作ステータスを更新する処理
        self.operationStatus = newStatus
    }

    func toggleRegister(isClosed: Bool) {
        // レジが閉じているかどうかのステータスを切り替える処理
        self.isRegisterClosed = isClosed
    }
}

// 列挙型であるMarketplaceType
enum MarketplaceType {
    case refill
    case newOpen
    case split
}

// 列挙型であるOperationStatus
enum OperationStatus {
    case before
    case processing
    case finished
}

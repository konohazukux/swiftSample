//
//  Market.swift
//  MapApp
//

import Foundation
import MapKit // MKPolygonはMapKitに含まれる

/// マーケットを表すクラス
class Market {
    /// マーケットID
    let id: String
    /// 市場ID（読み取り専用）
    let marketplaceID: String
    /// 参照元名
    var sourceName: String
    /// エリア（MKPolygonを使用）
    var area: MKPolygon
    /// マーケット名
    var marketName: String

    init(id: String, marketplaceID: String, sourceName: String, area: MKPolygon, marketName: String) {
        self.id = id
        self.marketplaceID = marketplaceID
        self.sourceName = sourceName
        self.area = area
        self.marketName = marketName
    }
    
    /// 参照元を変更する
    func changeSource(sourceName: String, area: MKPolygon) {
        self.sourceName = sourceName
        self.area = area
    }
    
    /// マーケット名を変更する
    func changeMarketName(to newName: String) {
        self.marketName = newName
    }
}

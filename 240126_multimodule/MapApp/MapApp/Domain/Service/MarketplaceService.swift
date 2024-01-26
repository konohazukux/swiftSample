//
//  MarketplaceService.swift
//  MapApp
//

import Foundation
import MapKit

class MarketplaceService {
    // 仮のデータソースを使用（本来はデータベースやAPIから取得）
    var marketplaces: [Marketplace] = []
    var markets: [Market] = []
  var allotmentAreas: [AllotmentArea] = []
   //   var visitPlans: [VisitPlan] = [] // VisitPlanクラスの定義が必要

      // 稼働中の市場を取得する
      func getActiveMarketplaces() -> [Marketplace] {
          return marketplaces.filter { $0.status == .processing }
      }

      // 特定の市場に属するマーケットを取得する
      func getMarkets(for marketplace: Marketplace) -> [Market] {
          return markets.filter { $0.marketplaceID == marketplace.id }
      }

      // 特定のマーケットに属する割当エリアを取得する
      func getAllotmentAreas(for market: Market) -> [AllotmentArea] {
          return allotmentAreas.filter { $0.marketId == market.id }
      }

//      // 特定の割当エリアに属する訪問計画を取得する
//      func getVisitPlans(for allotmentArea: AllotmentArea) -> [VisitPlan] {
//          // VisitPlanとAllotmentAreaの関連付けが必要
//          return visitPlans.filter { $0.allotmentAreaId == allotmentArea.id }
//      }

      // マーケットを保存する
      func saveMarket(_ market: Market) {
          // ここでマーケットの保存処理を行う
      }

      // 割当エリアを保存する
      func saveAllotmentArea(_ allotmentArea: AllotmentArea) {
          // ここで割当エリアの保存処理を行う
      }

      // 訪問計画を保存する
      func saveVisitPlan(_ visitPlan: VisitPlan) {
          // ここで訪問計画の保存処理を行う
      }

      // 市場を削除する
      func deleteMarketplace(_ marketplace: Marketplace) {
          // 市場の削除処理
      }

      // マーケットを削除する
      func deleteMarket(_ market: Market) {
          // マーケットの削除処理
      }

      // 割当エリアを削除する
      func deleteAllotmentArea(_ allotmentArea: AllotmentArea) {
          // 割当エリアの削除処理
      }

      // 制約に基づいた処理を実装
      // 例: 稼働ステータスが終了済の場合、変更不可
      func canChangeMarketplace(_ marketplace: Marketplace) -> Bool {
          return marketplace.status != .finished
      }

      // その他の制約に基づいた処理もここに実装
      // 例: マーケットの削除条件を満たしているか確認
}

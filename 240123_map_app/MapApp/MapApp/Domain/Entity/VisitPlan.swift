//
//  VisitPlan.swift
//  MapApp
//

import Foundation
import CoreLocation

class VisitPlan {
    let id: String // 訪問計画ID
    var name: String // 訪問計画名
    let allotmentAreaID: String // 割当エリアID
    var hasLine: Bool // 線の有無
    var route: [Int: CLLocationCoordinate2D] // ルート（ルート番号と座標の辞書）

    init(id: String, name: String, allotmentAreaID: String, hasLine: Bool, route: [Int: CLLocationCoordinate2D]) {
        self.id = id
        self.name = name
        self.allotmentAreaID = allotmentAreaID
        self.hasLine = hasLine
        self.route = route
    }

    // ルートの最後に追加
    func appendToRoute(coordinate: CLLocationCoordinate2D) {
        let newRouteNumber = (route.keys.max() ?? 0) + 1
        route[newRouteNumber] = coordinate
    }

    // ルートの途中に追加
    func insertIntoRoute(at routeNumber: Int, coordinate: CLLocationCoordinate2D) {
        route[routeNumber] = coordinate
    }

    // ルート番号を削除
    func removeFromRoute(at routeNumber: Int) {
        route.removeValue(forKey: routeNumber)
    }

    // ルート座標の変更
    func changeRouteCoordinate(at routeNumber: Int, to newCoordinate: CLLocationCoordinate2D) {
        if route.keys.contains(routeNumber) {
            route[routeNumber] = newCoordinate
        }
    }

    // 線の有無の変更
    func toggleLinePresence(hasLine: Bool) {
        self.hasLine = hasLine
    }

    // 名前の変更
    func changeName(to newName: String) {
        self.name = newName
    }
}

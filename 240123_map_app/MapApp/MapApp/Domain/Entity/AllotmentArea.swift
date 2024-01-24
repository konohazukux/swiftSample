//
//  AllotmentArea.swift
//  MapApp
//
//

import MapKit

class AllotmentArea {
    /// 割当エリアID
    let id: String

    /// マーケットID (読み取り専用)
    private(set) var marketId: String

    /// 編集可能エリア: MKPolygon
    var editableArea: MKPolygon

    /// 稼働エリア: MKPolygon
    var operationalArea: MKPolygon

    /// 社員ID (オプショナル)
    var employeeId: String?

    /// 同行社員ID (オプショナル)
    var companionEmployeeId: String?

    init(id: String, marketId: String, editableArea: MKPolygon, operationalArea: MKPolygon) {
        self.id = id
        self.marketId = marketId
        self.editableArea = editableArea
        self.operationalArea = operationalArea
    }

  func editEditableArea(to newArea: MKPolygon) {
        self.editableArea = newArea
    }

    func updateOperationalArea(to newArea: MKPolygon) {
        self.operationalArea = newArea
    }

    func assignEmployee(with id: String) {
        self.employeeId = id
    }

    func removeEmployee() {
        self.employeeId = nil
    }

    func assignCompanionEmployee(with id: String) {
        self.companionEmployeeId = id
    }

    func removeCompanionEmployee() {
        self.companionEmployeeId = nil
    }
}


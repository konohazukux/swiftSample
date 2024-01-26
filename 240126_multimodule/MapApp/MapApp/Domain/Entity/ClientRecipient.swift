//
//  ClientRecipient.swift
//  MapApp
//

import Foundation
import CoreLocation

class ClientRecipient {
    let id: String
    let businessUnitId: String
    let branchCode: String
    var name: String { didSet { name = oldValue } } // 読み取り専用
    let postalCode: String
    var prefectureCode: String { didSet { prefectureCode = oldValue } } // 読み取り専用
    var municipalityCode: String
    var address: String
    var coordinate: CLLocationCoordinate2D?
    let startDate: Date
    var endDate: Date?

    // 送客先の座標を取得するゲッター
    var recipientCoordinates: CLLocationCoordinate2D? {
        return coordinate
    }

    init(id: String, businessUnitId: String, branchCode: String, name: String, postalCode: String, prefectureCode: String, municipalityCode: String, address: String, coordinate: CLLocationCoordinate2D?, startDate: Date, endDate: Date?) {
        self.id = id
        self.businessUnitId = businessUnitId
        self.branchCode = branchCode
        self.name = name
        self.postalCode = postalCode
        self.prefectureCode = prefectureCode
        self.municipalityCode = municipalityCode
        self.address = address
        self.coordinate = coordinate
        self.startDate = startDate
        self.endDate = endDate
    }
}

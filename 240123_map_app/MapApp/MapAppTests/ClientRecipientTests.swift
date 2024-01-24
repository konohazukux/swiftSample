//
//  ClientRecipientTests.swift
//  MapAppTests
//

import XCTest
@testable import MapApp
import XCTest
import CoreLocation

class ClientRecipientTests: XCTestCase {
    
    func testClientRecipientInitialization() {
        let id = "123"
        let businessUnitId = "BU456"
        let branchCode = "BC789"
        let name = "Test Name"
        let postalCode = "1000001"
        let prefectureCode = "13"
        let municipalityCode = "01100"
        let address = "Test Address"
        let coordinate = CLLocationCoordinate2D(latitude: 35.6895, longitude: 139.6917)
        let startDate = Date()
        let endDate = Date().addingTimeInterval(86400) // 1 day later

        let recipient = ClientRecipient(id: id, businessUnitId: businessUnitId, branchCode: branchCode, name: name, postalCode: postalCode, prefectureCode: prefectureCode, municipalityCode: municipalityCode, address: address, coordinate: coordinate, startDate: startDate, endDate: endDate)

        XCTAssertEqual(recipient.id, id)
        XCTAssertEqual(recipient.businessUnitId, businessUnitId)
        XCTAssertEqual(recipient.branchCode, branchCode)
        XCTAssertEqual(recipient.name, name)
        XCTAssertEqual(recipient.postalCode, postalCode)
        XCTAssertEqual(recipient.prefectureCode, prefectureCode)
        XCTAssertEqual(recipient.municipalityCode, municipalityCode)
        XCTAssertEqual(recipient.address, address)
        XCTAssertEqual(recipient.coordinate?.latitude, coordinate.latitude)
        XCTAssertEqual(recipient.coordinate?.longitude, coordinate.longitude)
        XCTAssertEqual(recipient.startDate, startDate)
        XCTAssertEqual(recipient.endDate, endDate)
    }

    func testReadOnlyProperties() {
        let recipient = ClientRecipient(id: "123", businessUnitId: "BU456", branchCode: "BC789", name: "Test Name", postalCode: "1000001", prefectureCode: "13", municipalityCode: "01100", address: "Test Address", coordinate: nil, startDate: Date(), endDate: nil)

        let originalName = recipient.name
        let originalPrefectureCode = recipient.prefectureCode

        recipient.name = "New Name"
        recipient.prefectureCode = "14"

        XCTAssertEqual(recipient.name, originalName)
        XCTAssertEqual(recipient.prefectureCode, originalPrefectureCode)
    }

    func testRecipientCoordinatesGetter() {
        let coordinate = CLLocationCoordinate2D(latitude: 35.6895, longitude: 139.6917)
        let recipient = ClientRecipient(id: "123", businessUnitId: "BU456", branchCode: "BC789", name: "Test Name", postalCode: "1000001", prefectureCode: "13", municipalityCode: "01100", address: "Test Address", coordinate: coordinate, startDate: Date(), endDate: nil)

        let recipientCoordinates = recipient.recipientCoordinates
        XCTAssertEqual(recipientCoordinates?.latitude, coordinate.latitude)
        XCTAssertEqual(recipientCoordinates?.longitude, coordinate.longitude)
    }
}

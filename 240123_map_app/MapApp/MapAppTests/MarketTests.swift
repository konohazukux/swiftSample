//
//  MarketTests.swift
//  MapAppTests
//

import XCTest
@testable import MapApp
import MapKit

class MarketTests: XCTestCase {

    var market: Market!
    var polygon: MKPolygon!

    override func setUp() {
        super.setUp()
        // 適切なMKPolygonインスタンスを作成
        let coordinates = [
            CLLocationCoordinate2D(latitude: 35.6895, longitude: 139.6917),
            CLLocationCoordinate2D(latitude: 35.6895, longitude: 140.6917),
            CLLocationCoordinate2D(latitude: 36.6895, longitude: 140.6917),
            CLLocationCoordinate2D(latitude: 36.6895, longitude: 139.6917)
        ]
        polygon = MKPolygon(coordinates: coordinates, count: coordinates.count)
        market = Market(id: "123", marketplaceID: "456", sourceName: "Test Source", area: polygon, marketName: "Test Market")
    }

    override func tearDown() {
        market = nil
        polygon = nil
        super.tearDown()
    }

    func testMarketInitialization() {
        XCTAssertEqual(market.id, "123")
        XCTAssertEqual(market.marketplaceID, "456")
        XCTAssertEqual(market.sourceName, "Test Source")
        XCTAssertEqual(market.area, polygon) // MKPolygonの等価性チェックに注意
        XCTAssertEqual(market.marketName, "Test Market")
    }

    func testChangeSource() {
        let newPolygon = MKPolygon(coordinates: [CLLocationCoordinate2D(latitude: 37.6895, longitude: 138.6917)], count: 1)
        market.changeSource(sourceName: "New Source", area: newPolygon)
        XCTAssertEqual(market.sourceName, "New Source")
        XCTAssertEqual(market.area, newPolygon) // MKPolygonの等価性チェックに注意
    }

    func testChangeMarketName() {
        market.changeMarketName(to: "New Market Name")
        XCTAssertEqual(market.marketName, "New Market Name")
    }
}

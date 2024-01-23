//
//  MarketplaceTests.swift
//  MapAppTests
//

import XCTest
@testable import MapApp

class MarketplaceTests: XCTestCase {

    // 初期化のテスト
    func testMarketplaceInitialization() {
        let id = UUID().uuidString
        let marketplace = Marketplace(id: id, companyID: "comp123", destinationID: "dest123", type: .refill, isVisitHistoryVisible: true, status: .before)
        
        XCTAssertEqual(marketplace.id, id)
        XCTAssertEqual(marketplace.companyID, "comp123")
        XCTAssertEqual(marketplace.destinationID, "dest123")
        XCTAssertEqual(marketplace.type, .refill)
        XCTAssertTrue(marketplace.isVisitHistoryVisible)
        XCTAssertEqual(marketplace.status, .before)
    }
    
    // isEqualToMarketplaceIDメソッドのテスト
    func testIsEqualToMarketplaceID() {
        let id = UUID().uuidString
        let marketplace = Marketplace(id: id, companyID: "comp123", destinationID: "dest123", type: .refill, isVisitHistoryVisible: true, status: .before)
        
        XCTAssertTrue(marketplace.isEqualToMarketplaceID(idString: id))
        XCTAssertFalse(marketplace.isEqualToMarketplaceID(idString: UUID().uuidString))
    }

    // 送客先IDを変更するメソッドのテスト
    func testChangeDestinationID() {
        let marketplace = Marketplace(id: UUID().uuidString, companyID: "comp123", destinationID: "dest123", type: .refill, isVisitHistoryVisible: true, status: .before)
        let newDestinationID = "dest999"
        marketplace.changeDestinationID(to: newDestinationID)
        
        XCTAssertEqual(marketplace.destinationID, newDestinationID)
    }
    
    // 市場種別を変更するメソッドのテスト
    func testChangeMarketplaceType() {
        let marketplace = Marketplace(id: UUID().uuidString, companyID: "comp123", destinationID: "dest123", type: .refill, isVisitHistoryVisible: true, status: .before)
        marketplace.changeMarketplaceType(to: .newOpen)
        
        XCTAssertEqual(marketplace.type, .newOpen)
    }
    
    // 訪問履歴の表示可否を変更するメソッドのテスト
    func testChangeVisitHistoryVisibility() {
        let marketplace = Marketplace(id: UUID().uuidString, companyID: "comp123", destinationID: "dest123", type: .refill, isVisitHistoryVisible: true, status: .before)
        marketplace.changeVisitHistoryVisibility(to: false)
        
        XCTAssertFalse(marketplace.isVisitHistoryVisible)
    }
    
    // 稼働を開始するメソッドのテスト
    func testStartOperation() {
        let marketplace = Marketplace(id: UUID().uuidString, companyID: "comp123", destinationID: "dest123", type: .refill, isVisitHistoryVisible: true, status: .before)
        marketplace.startOperation()
        
        XCTAssertEqual(marketplace.status, .processing)
    }
    
    // 稼働を終了するメソッドのテスト
    func testStopOperation() {
        let marketplace = Marketplace(id: UUID().uuidString, companyID: "comp123", destinationID: "dest123", type: .refill, isVisitHistoryVisible: true, status: .processing)
        marketplace.stopOperation()
        
        XCTAssertEqual(marketplace.status, .finished)
    }
}

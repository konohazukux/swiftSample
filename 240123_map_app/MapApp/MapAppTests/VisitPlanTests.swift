//
//  VisitPlanTests.swift
//  MapAppTests
//

import XCTest
import CoreLocation
@testable import MapApp

class VisitPlanTests: XCTestCase {

    func testInitialization() {
        let visitPlan = VisitPlan(id: "1", name: "Test Plan", allotmentAreaID: "A1", hasLine: true, route: [:])
        XCTAssertNotNil(visitPlan)
        XCTAssertEqual(visitPlan.id, "1")
        XCTAssertEqual(visitPlan.name, "Test Plan")
        XCTAssertEqual(visitPlan.allotmentAreaID, "A1")
        XCTAssertTrue(visitPlan.hasLine)
        XCTAssertTrue(visitPlan.route.isEmpty)
    }

    func testAppendToRoute() {
        let visitPlan = VisitPlan(id: "1", name: "Test Plan", allotmentAreaID: "A1", hasLine: true, route: [:])
        let newCoordinate = CLLocationCoordinate2D(latitude: 35.0, longitude: 135.0)
        visitPlan.appendToRoute(coordinate: newCoordinate)

        XCTAssertEqual(visitPlan.route.count, 1)
        assertCoordinatesEqual(visitPlan.route[1]!, newCoordinate)
    }

    func testInsertIntoRoute() {
        let visitPlan = VisitPlan(id: "1", name: "Test Plan", allotmentAreaID: "A1", hasLine: true, route: [:])
        let newCoordinate = CLLocationCoordinate2D(latitude: 36.0, longitude: 136.0)
        visitPlan.insertIntoRoute(at: 1, coordinate: newCoordinate)

        XCTAssertEqual(visitPlan.route.count, 1)
        assertCoordinatesEqual(visitPlan.route[1]!, newCoordinate)
    }

    func testRemoveFromRoute() {
        let visitPlan = VisitPlan(id: "1", name: "Test Plan", allotmentAreaID: "A1", hasLine: true, route: [1: CLLocationCoordinate2D(latitude: 35.0, longitude: 135.0)])
        visitPlan.removeFromRoute(at: 1)

        XCTAssertTrue(visitPlan.route.isEmpty)
    }

    func testChangeRouteCoordinate() {
      let visitPlan = VisitPlan(id: "1", name: "Test Plan", allotmentAreaID: "A1", hasLine: true, route: [1: CLLocationCoordinate2D(latitude: 35.0, longitude: 135.0)])
        let newCoordinate = CLLocationCoordinate2D(latitude: 36.0, longitude: 136.0)
        visitPlan.changeRouteCoordinate(at: 1, to: newCoordinate)
        assertCoordinatesEqual(visitPlan.route[1]!, newCoordinate)
    }

    func testToggleLinePresence() {
      let visitPlan = VisitPlan(id: "1", name: "Test Plan", allotmentAreaID: "A1", hasLine: true, route: [:])
        visitPlan.toggleLinePresence(hasLine: false)
        XCTAssertFalse(visitPlan.hasLine)
    }

    func testChangeName() {
      let visitPlan = VisitPlan(id: "1", name: "Test Plan", allotmentAreaID: "A1", hasLine: true, route: [:])
        visitPlan.changeName(to: "Updated Plan")
        XCTAssertEqual(visitPlan.name, "Updated Plan")
    }

    // Helper function to compare CLLocationCoordinate2D
    private func assertCoordinatesEqual(_ lhs: CLLocationCoordinate2D, _ rhs: CLLocationCoordinate2D, accuracy: CLLocationDegrees = 0.000001) {
        XCTAssertEqual(lhs.latitude, rhs.latitude, accuracy: accuracy)
        XCTAssertEqual(lhs.longitude, rhs.longitude, accuracy: accuracy)
    }
}

import Foundation
import AOCCore
import XCTest

final class PointTests: XCTestCase {
    func testAnglesComputeCorrectly() {
        let point1 = Point(x: 0, y: 0)
        let point2 = Point(x: 10, y: 10)
        XCTAssertEqual(45, point1.angle(to: point2))
    }

    func testOtherAnglesComputeCorrectly() {
        let point1 = Point(x: 9, y: 7)
        let point2 = Point(x: 7, y: 9)
        XCTAssertEqual(45, point1.angle(to: point2))
    }

    func testPointsAreTouching() {
        let point1 = Point(x: 10, y: 10)
        do {
            let point2 = Point(x: 11, y: 10)
            XCTAssertTrue(point1.isTouching(point2))
        }

        do {
            let point2 = Point(x: 11, y: 11)
            XCTAssertTrue(point1.isTouching(point2))
        }

        do {
            let point2 = Point(x: 10, y: 11)
            XCTAssertTrue(point1.isTouching(point2))
        }

        do {
            let point2 = Point(x: 9, y: 10)
            XCTAssertTrue(point1.isTouching(point2))
        }
    }

    func testPointsAreNotTouching() {
        do {
            let point1 = Point(x: 4, y: 2)
            let point2 = Point(x: 3, y: 0)
            XCTAssertFalse(point1.isTouching(point2))
        }

        do {
            let point1 = Point(x: 0, y: 0)
            let point2 = Point(x: 2, y: 0)
            XCTAssertFalse(point1.isTouching(point2))
        }

        do {
            let point1 = Point(x: 0, y: 0)
            let point2 = Point(x: 0, y: 2)
            XCTAssertFalse(point1.isTouching(point2))
        }

        do {
            let point1 = Point(x: 0, y: 0)
            let point2 = Point(x: 2, y: 1)
            XCTAssertFalse(point1.isTouching(point2))
        }
    }
}

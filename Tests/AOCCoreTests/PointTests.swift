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
}

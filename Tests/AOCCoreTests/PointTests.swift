import Foundation
import AOCCore
import XCTest

final class PointTests: XCTestCase {
    func testAnglesComputeCorrectly() {
        let point1 = Point(x: 0, y: 0)
        let point2 = Point(x: 10, y: 10)
        XCTAssertEqual(45, point1.angle(to: point2))
    }
}

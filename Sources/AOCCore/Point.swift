import Foundation
import Algorithms

public struct Point: Hashable {
    public let x: Int
    public let y: Int

    public init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }

    /// The up, down, left, and right neighbors for a point
    public var neighbors4: [Point] {
        let up = Point(x: x, y: y - 1)
        let down = Point(x: x, y: y + 1)
        let left = Point(x: x - 1, y: y)
        let right = Point(x: x + 1, y: y)

        let neighbors = [up, down, left, right]
            .filter({ $0.x >= 0 && $0.y >= 0 })

        return neighbors
    }
}

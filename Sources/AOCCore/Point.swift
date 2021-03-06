import Foundation
import Algorithms

public struct Point: Hashable {
    public let x: Int
    public let y: Int

    public init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}

public extension Point {
    /// The up, down, left, and right neighbors for a point. Takes in to account filtering points with negative x or
    /// y numbers but does not account for the maximum point size. The caller must filter for that.
    var neighbors4: [Point] {
        let up = Point(x: x, y: y - 1)
        let down = Point(x: x, y: y + 1)
        let left = Point(x: x - 1, y: y)
        let right = Point(x: x + 1, y: y)

        let neighbors = [up, down, left, right]
            .filter({ $0.x >= 0 && $0.y >= 0 })

        return neighbors
    }

    /// The up, down, left, right, and diagonal neighbors for a point. Takes in to account filtering points with
    /// negative x or y numbers but does not account for the maximum point size. The caller must filter for that.
    var neighbors8: [Point] {
        let up = Point(x: x, y: y - 1)
        let upLeft = Point(x: x - 1, y: y - 1)
        let upRight = Point(x: x + 1, y: y - 1)
        let down = Point(x: x, y: y + 1)
        let downLeft = Point(x: x - 1, y: y + 1)
        let downRight = Point(x: x + 1, y: y + 1)
        let left = Point(x: x - 1, y: y)
        let right = Point(x: x + 1, y: y)

        let neighbors = [up, down, left, right, upLeft, upRight, downLeft, downRight]
            .filter({ $0.x >= 0 && $0.y >= 0 })

        return neighbors
    }

    func angle(to other: Point) -> CGFloat {
        let originX = other.x - x
        let originY = other.y - y
        let bearingRadians = atan2f(Float(originY), Float(originX))
        var bearingDegrees = CGFloat(bearingRadians).degrees

        while bearingDegrees < 0 {
            bearingDegrees += 360
        }

        return bearingDegrees.rounded(.down)
    }
}

private extension CGFloat {
    var degrees: CGFloat {
        return self * CGFloat(180) / .pi
    }
}

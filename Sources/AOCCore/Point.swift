import Foundation
import Algorithms

public struct Point: Hashable {
    public var x: Int
    public var y: Int

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

    func isDiagonalTo(_ other: Point) -> Bool {
        let (xDiff, yDiff) = absoluteDistanceTo(other)
        return xDiff == 1 && yDiff == 1
    }

    func isTouching(_ other: Point) -> Bool {
        if self == other { return true }
        let (xDiff, yDiff) = absoluteDistanceTo(other)
        return xDiff <= 1 && yDiff <= 1
    }

    func distanceTo(_ other: Point) -> (x: Int, y: Int) {
        let xDiff = x - other.x
        let yDiff = y - other.y
        return (xDiff, yDiff)
    }

    func absoluteDistanceTo(_ other: Point) -> (x: Int, y: Int) {
        let (x, y) = distanceTo(other)
        return (abs(x), abs(y))
    }

    func inSameColumn(as other: Point) -> Bool {
        x == other.x
    }

    func inSameRow(as other: Point) -> Bool {
        y == other.y
    }
}

private extension CGFloat {
    var degrees: CGFloat {
        return self * CGFloat(180) / .pi
    }
}

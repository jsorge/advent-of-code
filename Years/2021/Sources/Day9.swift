//
//  Day9.swift
//  AdventOfCode
//

import Foundation
import AOCCore
import Algorithms

final class Day9: Day {
    func part1(_ input: String) -> CustomStringConvertible {
        let lines = input.toLines()
            .compactMap({ $0.compactMap({ Int(character: $0) }) })

        let grid = Grid(lines)

        var lowestValues = [(Point, Int)]()

        let columns = lines.first!.count
        let rows = lines.count
        for box in grid {
            let neighbors = box.key
                .neighbors4
                .filter({ $0.x < columns && $0.y < rows })
                .compactMap({ grid[$0] })

            if neighbors.allAreGreaterThan(box.value) {
                lowestValues.append(box)
            }
        }

        return lowestValues
            .map({ $0.1 + 1 })
            .reduce(0, +)
    }

    func part2(_ input: String) -> CustomStringConvertible {
        let lines = input.toLines()
            .compactMap({ $0.compactMap({ Int(character: $0) }) })

        let grid = Grid(lines)

        var lowestValues = [(Point, Int)]()

        let columns = lines.first!.count
        let rows = lines.count
        for box in grid {
            let neighbors = box.key
                .neighbors4
                .filter({ $0.x < columns && $0.y < rows })
                .compactMap({ grid[$0] })

            if neighbors.allAreGreaterThan(box.value) {
                lowestValues.append(box)
            }
        }

        var basinSizes = [Int]()

        for lowPoint in lowestValues.map({ $0.0 }) {
            var stack = [lowPoint]
            var seen = Set<Point>()

            while let point = stack.popLast() {
                guard seen.insert(point).inserted else { continue }
                for neighbor in point.neighbors4 {
                    if let x = grid[neighbor], x != 9 {
                        stack.append(neighbor)
                    }
                }
            }

            basinSizes.append(seen.count)
        }

        return basinSizes
            .max(count: 3, sortedBy: { $1 > $0 })
            .product
    }
}

private extension Array where Element == Int {
    func allAreGreaterThan(_ other: Int) -> Bool {
        guard self.count > 0 else { return false }
        return allSatisfy({ $0 > other })
    }

    var product: Int {
        guard count > 0 else { return 0 }
        var output = self.first!
        let remaining = self.dropFirst()
        for number in remaining {
            output *= number
        }
        return output
    }
}

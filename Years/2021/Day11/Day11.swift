//
//  Day11.swift
//  AdventOfCode
//

import Foundation
import AOCCore

// https://adventofcode.com/2021/day/11

final class Day11: Day {
    func part1(_ input: String) -> CustomStringConvertible {
        let rawGrid = input
            .toLines()
            .map({ $0.compactMap({ Int(character: $0) }) })
        var grid = Grid(rawGrid)

        let numberOfSteps = 100
        var flashes = 0
        for _ in 1...numberOfSteps {
            var flashPoints = Set<Point>()
            grid.incrementAllPoints(by: 1)

            grid
                .filter({ $0.value > 9 })
                .forEach({ grid.flashAndIncrease(from: $0.key, flashPoints: &flashPoints) })

            grid.resetPoints(flashPoints)
            flashes += flashPoints.count
        }

        return flashes
    }

    func part2(_ input: String) -> CustomStringConvertible {
        let rawGrid = input
            .toLines()
            .map({ $0.compactMap({ Int(character: $0) }) })
        var grid = Grid(rawGrid)

        var outStep = 0
        for step in 1... {
            var flashPoints = Set<Point>()
            grid.incrementAllPoints(by: 1)

            grid
                .filter({ $0.value > 9 })
                .forEach({ grid.flashAndIncrease(from: $0.key, flashPoints: &flashPoints) })

            if flashPoints.count == grid.numberOfBoxes {
                outStep = step
                break
            }

            grid.resetPoints(flashPoints)
        }

        return outStep
    }
}

private extension Dictionary where Key == Point, Value == Int {
    mutating func flashAndIncrease(from point: Point,
                                   flashPoints: inout Set<Point>, from sendingPoint: Point? = nil)
    {
        guard self[point, default: 0] > 9 else {
            self[point, default: 0] += 1
            return
        }

        self[point] = 0

        if flashPoints.contains(point) == false {
            flashPoints.insert(point)

            self.neighbors8(for: point)
                .filter({ $0 != sendingPoint })
                .forEach({
                    self[$0, default: 0] += 1
                    if self[$0, default: 0] > 9 {
                        self.flashAndIncrease(from: $0, flashPoints: &flashPoints, from: point)
                    }
                })
        }
    }

    mutating func incrementAllPoints(by increase: Value) {
        for pair in self {
            self[pair.key, default: 0] += increase
        }
    }

    mutating func resetPoints(_ points: Set<Point>) {
        points.forEach({ self[$0] = 0 })
    }
}

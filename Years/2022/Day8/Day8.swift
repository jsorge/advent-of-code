//
//  Day8.swift
//  AdventOfCode
//

import Foundation
import AOCCore

// https://adventofcode.com/2022/day/8

final class Day8: Day {
    func part1(_ input: String) -> CustomStringConvertible {
        let grid = input.toIntGrid()
        let lines = input.toLines(omittingEmpties: true)

        var visibleCount = 0
        for (point, value) in grid {
            if point.x == 0 || point.y == 0 ||
                point.x == lines[0].count - 1 || point.y == lines.count - 1
            {
                visibleCount += 1
                continue
            }

            let toLeft = grid.keys.filter({ $0.x < point.x && $0.y == point.y }).map({ grid[$0]! })
            let toRight = grid.keys.filter({ $0.x > point.x && $0.y == point.y }).map({ grid[$0]! })
            let above = grid.keys.filter({ $0.y < point.y && $0.x == point.x }).map({ grid[$0]! })
            let below = grid.keys.filter({ $0.y > point.y && $0.x == point.x }).map({ grid[$0]! })

            if toLeft.allSatisfy({ $0 < value }) ||
                toRight.allSatisfy({ $0 < value }) ||
                above.allSatisfy({ $0 < value }) ||
                below.allSatisfy({ $0 < value })
            {
                visibleCount += 1
            }
        }

        return visibleCount
    }

    func part2(_ input: String) -> CustomStringConvertible {
        let grid = input.toIntGrid()
        let lines = input.toLines(omittingEmpties: true)

        var highScore = 0
        for (point, value) in grid {
            if point.y == 0 || point.y == lines.count - 1 ||
                point.x == 0 || point.x == lines[0].count - 1
            {
                continue
            }

            let toLeft = grid.keys
                .filter({ $0.x < point.x && $0.y == point.y })
                .sorted(by: { $0.x > $1.x })
                .map({ grid[$0]! })

            let toRight = grid.keys
                .filter({ $0.x > point.x && $0.y == point.y })
                .sorted(by: { $0.x < $1.x })
                .map({ grid[$0]! })

            let above = grid.keys
                .filter({ $0.y < point.y && $0.x == point.x })
                .sorted(by: { $0.y > $1.y })
                .map({ grid[$0]! })

            let below = grid.keys
                .filter({ $0.y > point.y && $0.x == point.x })
                .sorted(by: { $0.y < $1.y })
                .map({ grid[$0]! })

            let rightScore = toRight.firstIndex(where: { value <= $0 }) ?? toRight.count - 1
            let leftScore = toLeft.firstIndex(where: { value <= $0 }) ?? toLeft.count - 1
            let aboveScore = above.firstIndex(where: { value <= $0 }) ?? above.count - 1
            let belowScore = below.firstIndex(where: { value <= $0 }) ?? below.count - 1

            let siteScore = (rightScore + 1) * (leftScore + 1) * (aboveScore + 1) * (belowScore + 1)
            if siteScore > highScore {
                highScore = siteScore
            }
        }

        return highScore
    }
}

//
//  Day9.swift
//  AdventOfCode
//

import Foundation
import AOCCore
import Algorithms
import Collections

// https://adventofcode.com/2022/day/9

final class Day9: Day {
    func part1(_ input: String) -> CustomStringConvertible {
        return computeTailPositionCount(from: input, knotCount: 2)
    }

    func part2(_ input: String) -> CustomStringConvertible {
        return computeTailPositionCount(from: input, knotCount: 10)
    }

    private func computeTailPositionCount(from input: String, knotCount: Int) -> Int {
        var points = Array(repeating: Point(x: 0, y: 0), count: knotCount)
        let tailPositions = input
            .toLines(omittingEmpties: true)
            .reduce(into: Set<Point>(), { partialResult, string in
                let instruction = Instruction(string: string)
                for _ in 1 ... instruction.amount {
                    points = self.applyDirection(instruction.direction, to: points)
                    partialResult.insert(points.last!)
                }
            })

        return tailPositions.count
    }

    private func applyDirection(_ direction: Direction, to points: [Point]) -> [Point] {
        var newPoints = points

        newPoints[0].moveByOne(direction: direction)

        for i in 1 ..< points.count {
            let head = newPoints[i - 1]
            var tail = newPoints[i]

            let (colDiff, rowDiff) = head.distanceTo(tail)
            if tail.isTouching(head) == false {
                if tail.inSameColumn(as: head) {
                    tail.moveByOne(direction: rowDiff > 0 ? .up : .down)
                }
                else if tail.inSameRow(as: head) {
                    tail.moveByOne(direction: colDiff > 0 ? .right : .left)
                }
                else {
                    // right
                    if colDiff == 2 {
                        tail.moveByOne(direction: .right)
                        tail.moveByOne(direction: rowDiff > 0 ? .up : .down)
                    }
                    // left
                    else if colDiff == -2 {
                        tail.moveByOne(direction: .left)
                        tail.moveByOne(direction: rowDiff > 0 ? .up : .down)
                    }
                    // up
                    else if rowDiff == 2 {
                        tail.moveByOne(direction: .up)
                        tail.moveByOne(direction: colDiff > 0 ? .right : .left)
                    }
                    // down
                    else if rowDiff == -2 {
                        tail.moveByOne(direction: .down)
                        tail.moveByOne(direction: colDiff > 0 ? .right : .left)
                    }
                }
            }

            newPoints[i] = tail
        }

        return newPoints
    }
}

private enum Direction: Substring {
    case up = "U"
    case down = "D"
    case left = "L"
    case right = "R"
}

private struct Instruction {
    var direction: Direction
    var amount: Int

    init(string: String) {
        let regex = /(\w) (\d+)/
        let match = try! regex.firstMatch(in: string)!
        direction = Direction(rawValue: match.output.1)!
        amount = Int(match.output.2)!
    }
}

private extension Point {
    mutating func moveByOne(direction: Direction) {
        switch direction {
        case .up:
            y += 1
        case .down:
            y -= 1
        case .left:
            x -= 1
        case .right:
            x += 1
        }
    }
}

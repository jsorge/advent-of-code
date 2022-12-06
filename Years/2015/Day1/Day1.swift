//
//  Day1.swift
//  AdventOfCode
//

import Foundation
import AOCCore

// https://adventofcode.com/2015/day/1

final class Day1: Day {
    func part1(_ input: String) -> CustomStringConvertible {
        let directions = input
            .reduce(into: [Bool: Int]()) { partialResult, char in
                if char == "(" {
                    partialResult[true, default: 0] += 1
                } else if char == ")" {
                    partialResult[false, default: 0] += 1
                }
            }

        let ups = directions[true]!
        let downs = directions[false]!

        return ups - downs
    }

    func part2(_ input: String) -> CustomStringConvertible {
        var floor = 0
        var position = 0

        for (idx, instruction) in input.enumerated() {
            if instruction == "(" {
                floor += 1
            } else if instruction == ")" {
                floor -= 1
            }

            if floor < 0 {
                position = idx + 1
                break
            }
        }

        return position
    }
}

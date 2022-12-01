//
//  Day1.swift
//  AdventOfCode
//

import Foundation
import AOCCore

// https://adventofcode.com/2022/day/1

final class Day1: Day {
    func part1(_ input: String) -> CustomStringConvertible {
        return topThreeElves(from: input).max()!
    }

    func part2(_ input: String) -> CustomStringConvertible {
        return topThreeElves(from: input)
            .reduce(0, +)
    }

    private func topThreeElves(from input: String) -> [Int] {
        let groups = input
            .toLines()
            .reduce(into: ([Int](), 0)) { partial, line in
                var (elves, current) = partial
                if line.isEmpty {
                    elves.append(current)
                    partial = (elves, 0)
                    return
                }

                let value = Int(line)!
                current += value
                partial = (elves, current)
            }
        var elves = groups.0
        elves.append(groups.1)

        let topThree = elves
            .sorted(by: > )
            .prefix(upTo: 3)

        return Array(topThree)
    }
}

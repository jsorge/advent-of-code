//
//  Day3.swift
//  AdventOfCode
//

import Foundation
import AOCCore
import Algorithms

// https://adventofcode.com/2022/day/3

final class Day3: Day {
    func part1(_ input: String) -> CustomStringConvertible {
        let priorities = input.toLines()
            .compactMap { self.computeRucksackItemPriority($0) }
            .reduce(0, +)

        return priorities
    }

    func part2(_ input: String) -> CustomStringConvertible {
        let groups = input.toLines()
            .chunks(ofCount: 3)

        var totalPriority = 0
        for group in groups {
            guard group.count == 3 else { continue }
            let sacks = group.map(Set.init)
            let first = sacks[0]
            let second = sacks[1]
            let third = sacks[2]

            var overlap = first.intersection(second)
            overlap.formIntersection(third)
            let priority = overlap.first!.indexValue!

            totalPriority += priority
        }

        return totalPriority
    }

    private func computeRucksackItemPriority(_ sack: String) -> Int? {
        let compartmentSize = sack.count / 2
        guard compartmentSize > 0 else { return nil }

        let compartments = sack
            .chunks(ofCount: compartmentSize)
            .map(Set.init)

        let left = compartments[0]
        let right = compartments[1]
        let overlap = String(left.intersection(right).first!)

        let priority = overlap.first!.indexValue!

        return priority
    }
}

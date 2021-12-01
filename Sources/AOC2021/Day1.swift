//
//  Day1.swift
//  AdventOfCode
//

import Foundation
import AOCCore

final class Day1: Day {
    func part1(_ input: String) -> CustomStringConvertible {
        let ints = input.toIntArray()

        let increases = ints.adjacentPairs()
            .filter({ $1 > $0 })
            .count

        return increases
    }

    func part2(_ input: String) -> CustomStringConvertible {
        let ints = input.toIntArray()

        let count = ints
            .windows(ofCount: 3)
            .map({ $0.sum })
            .adjacentPairs()
            .filter({ $1 > $0 })
            .count

        return count
    }
}

private extension ArraySlice where Element == Int {
    var sum: Int {
        return self.reduce(0, +)
    }
}

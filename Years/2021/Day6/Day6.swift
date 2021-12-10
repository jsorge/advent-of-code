//
//  Day6.swift
//  AdventOfCode
//

import Foundation
import AOCCore

final class Day6: Day {
    func part1(_ input: String) -> CustomStringConvertible {
        let fishes = input.toLines()[0].split(separator: ",").compactMap({ Int(substring: $0) })
        return fishes.countNumberOfFish(after: 80)
    }

    func part2(_ input: String) -> CustomStringConvertible {
        let fishes = input.toLines()[0].split(separator: ",").compactMap({ Int(substring: $0) })
        return fishes.countNumberOfFish(after: 256)
    }
}

private extension Array where Element == Int {
    func countNumberOfFish(after days: Int) -> Int {
        var fishNumbers = self.reduce(into: [Int: Int](), { $0[$1, default: 0] += 1 })

        for _ in 1...days {
            fishNumbers = fishNumbers.reduce(into: [Int: Int](), { partialResult, fishCount in
                var newDay = fishCount.key - 1
                if newDay < 0 {
                    newDay = 6
                    partialResult[8] = fishCount.value
                }
                partialResult[newDay, default: 0] += fishCount.value
            })
        }

        let allValues = fishNumbers.map({ $0.value })

        return allValues.reduce(0, +)
    }
}

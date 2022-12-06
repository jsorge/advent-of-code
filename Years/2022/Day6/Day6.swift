//
//  Day6.swift
//  AdventOfCode
//

import Foundation
import AOCCore
import Algorithms

// https://adventofcode.com/2022/day/6

final class Day6: Day {
    func part1(_ input: String) -> CustomStringConvertible {
        let windowSize = 4
        return findControlCharacter(in: input, afterUniqueCount: windowSize)
    }

    func part2(_ input: String) -> CustomStringConvertible {
        let windowSize = 14
        return findControlCharacter(in: input, afterUniqueCount: windowSize)
    }

    private func findControlCharacter(in input: String, afterUniqueCount count: Int) -> Int {
        for (idx, window) in input.windows(ofCount: count).enumerated() {
            guard String(window).hashedCollection.count == count else { continue }
            let markerIndex = idx + count
            return markerIndex
        }

        return 0
    }
}

private extension String {
    var hashedCollection: Set<String> {
        return Set(map { String($0) })
    }
}

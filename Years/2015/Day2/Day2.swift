//
//  Day2.swift
//  AdventOfCode
//

import Foundation
import AOCCore

// https://adventofcode.com/2015/day/2

final class Day2: Day {
    func part1(_ input: String) -> CustomStringConvertible {
        return input
            .toLines(omittingEmpties: true)
            .map { Box(string: $0) }
            .map {
                $0.surfaceArea + $0.smallestSideArea
            }
            .reduce(0, +)
    }

    func part2(_ input: String) -> CustomStringConvertible {
        return input
            .toLines(omittingEmpties: true)
            .map { Box(string: $0) }
            .map { box -> Int in
                (box.smallestSide.0 * 2) + (box.smallestSide.1 * 2) + box.volume
            }
            .reduce(0, +)
    }
}

private struct Box {
    let length: Int
    let width: Int
    let height: Int

    var surfaceArea: Int {
        (2 * length * width) + (2 * width * height) + (2 * height * length)
    }

    var smallestSide: (Int, Int) {
        let shortestSides = [length, width, height]
            .sorted()
            .prefix(2)

        return (shortestSides.first!, shortestSides.last!)
    }

    var volume: Int {
        length * width * height
    }

    var smallestSideArea: Int {
        let c1 = length * width
        let c2 = length * height
        let c3 = width * height

        return min(min(c1, c2), c3)
    }

    init(string: String) {
        let regex = /(\d+)x(\d+)x(\d+)/
        let match = try! regex.firstMatch(in: string)!
        self.length = Int(match.output.1)!
        self.width = Int(match.output.2)!
        self.height = Int(match.output.3)!
    }
}

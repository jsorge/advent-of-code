//
//  Day8.swift
//  AdventOfCode
//

import Foundation
import AOCCore

final class Day8: Day {
    func part1(_ input: String) -> CustomStringConvertible {
        enum Digit: Int {
            // The raw value is the number of segments lit up to show the digit
            case one = 2
            case four = 4
            case seven = 3
            case eight = 7
        }

        let lines = input.toLines()
            .map({ $0.split(separator: "|")[1] })

        var digits = [Digit: Int]()
        for line in lines {
            line
                .split(separator: " ")
                .compactMap({ Digit(rawValue: $0.count) })
                .forEach({ digits[$0, default: 0] += 1 })
        }

        return digits.map({ $0.value }).reduce(0, +)
    }

    func part2(_ input: String) -> CustomStringConvertible {
        let lines = input.toLines()
            .map({ $0.split(separator: "|")[1] })



        return 0
    }
}

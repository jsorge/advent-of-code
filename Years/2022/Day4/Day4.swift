//
//  Day4.swift
//  AdventOfCode
//

import Foundation
import AOCCore

// https://adventofcode.com/2022/day/4

final class Day4: Day {
    func part1(_ input: String) -> CustomStringConvertible {
        let pairs = input.toLines()

        var contained = 0
        for assignments in pairs {
            guard assignments.isEmpty == false else { continue }
            let (range1, range2) = parseLineToPairs(assignments)
            if range1.contains(range2) || range2.contains(range1) {
                contained += 1
            }
        }

        return contained
    }

    func part2(_ input: String) -> CustomStringConvertible {
        let pairs = input.toLines()

        var intersections = 0
        for assignments in pairs {
            guard assignments.isEmpty == false else { continue }
            let (range1, range2) = parseLineToPairs(assignments)

            if range1.overlaps(range2) {
                intersections += 1
            }
        }

        return intersections
    }

    private func parseLineToPairs(_ line: String) -> (ClosedRange<Int>, ClosedRange<Int>) {
        let regex = #/(\d+)-(\d+),(\d+)-(\d+)/#
        let matches = try! regex.firstMatch(in: line)!
        let range1 = Int(matches.1)!...Int(matches.2)!
        let range2 = Int(matches.3)!...Int(matches.4)!

        return (range1, range2)
    }
}

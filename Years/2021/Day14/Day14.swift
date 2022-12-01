//
//  Day14.swift
//  AdventOfCode
//

import Foundation
import AOCCore
import Algorithms
import Collections

// https://adventofcode.com/2021/day/14

final class Day14: Day {
    func part1(_ input: String) -> CustomStringConvertible {
        let (highCount, lowCount) = findPolymerCount(in: input, repetitions: 10)
        return highCount - lowCount
    }

    func part2(_ input: String) -> CustomStringConvertible {
        let (highCount, lowCount) = findPolymerCount(in: input, repetitions: 40)
        return highCount - lowCount
    }

    private func findPolymerCount(in input: String, repetitions: Int) -> (highCount: Int, lowCount: Int) {
        var lines = input.toLines()

        var pattern = lines.removeFirst()

        let associations = lines.reduce(into: [String: Character]()) { partialResult, line in
            let regex = NSRegularExpression(#"^(\w\w) -> (\w)$"#)
            let matches = regex.allMatches(in: line)
            partialResult[matches[1]] = matches[2].first!
        }

        for round in 1...repetitions {
            print("round \(round) starting")
            let start = Date()
            let newPattern = pattern
                .windows(ofCount: 2)
                .enumerated()
                .reduce(into: "") { partialResult, window in
                    let (index, subPattern) = window
                    guard let elementToInsert = associations[String(subPattern)] else { return }
                    let joinedElement = "\(elementToInsert)\(subPattern.last!)"

                    if index == 0 {
                        partialResult += "\(pattern.first!)"
                    }

                    partialResult += joinedElement
                }

            pattern = newPattern
            print("Round \(round) ended: \(Date().timeIntervalSince(start))")
        }

        let sortedElements = pattern
            .reduce(into: [Character: Int]()) { partialResult, char in
                partialResult[char, default: 0] += 1
            }
            .sorted(by: { $0.value < $1.value })

        let lowCount = sortedElements.first!.value
        let highCount = sortedElements.last!.value

        return (highCount, lowCount)
    }
}

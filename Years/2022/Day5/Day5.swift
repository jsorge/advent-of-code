//
//  Day5.swift
//  AdventOfCode
//

import Foundation
import AOCCore
import RegexBuilder

// https://adventofcode.com/2022/day/5

final class Day5: Day {
    func part1(_ input: String) -> CustomStringConvertible {
        determineCrateMoves(from: input, reversed: true)
    }

    func part2(_ input: String) -> CustomStringConvertible {
        determineCrateMoves(from: input, reversed: false)
    }

    private func determineCrateMoves(from input: String, reversed: Bool) -> String {
        var lines = input.toLines()

        var intermediateStacks = [[String?]]()
        for _ in lines {
            let line = lines.removeFirst()
            guard line != "" else { break }

            let crates = extractCratesFromLine(line)
            for (idx, crate) in crates.enumerated() {
                var stack = intermediateStacks[safe: idx] ?? []
                stack.append(crate)

                if intermediateStacks[safe: idx] == nil {
                    intermediateStacks.insert(stack, at: idx)
                } else {
                    intermediateStacks[idx] = stack
                }
            }
        }

        var stacks = intermediateStacks
            .map { $0.reversed().compactMap { str in str ?? nil } }
            .map { Stack($0) }

        for line in lines {
            guard line != "" else { continue }
            let instruction = Instruction(line: line)
            var src = stacks[instruction.source]
            var dest = stacks[instruction.destination]

            precondition(instruction.qty <= src.count, "There aren't going to be enough boxes to pick off the source")

            let crates = src.pop(instruction.qty)
            dest.push(contentsOf: reversed ? crates.reversed() : crates)

            stacks[instruction.source] = src
            stacks[instruction.destination] = dest
        }

        let output = stacks
            .map { $0.peek }
            .compactMap { $0 }
            .joined()

        return output
    }

    private func extractCratesFromLine(_ line: String) -> [String?] {
        let regex = /(?:   |\[(\w)\]) ?/
        return line
            .matches(of: regex)
            .map {
                if let capture = $0.output.1 {
                    return String(capture)
                } else {
                    return nil
                }
            }
    }
}

private struct Instruction: CustomDebugStringConvertible {
    let source: Int
    let destination: Int
    let qty: Int

    init(line: String) {
        let regex = /^move (\d+) from (\d+) to (\d+)$/
        let matches = try! regex.firstMatch(in: line)!
        self.source = Int(matches.output.2)! - 1
        self.destination = Int(matches.output.3)! - 1
        self.qty = Int(matches.output.1)!
    }

    var debugDescription: String {
        "Source: \(source + 1), Destination: \(destination + 1), Moving: \(qty)"
    }
}

//
//  Day2.swift
//  AdventOfCode
//

import Foundation
import AOCCore

final class Day2: Day {
    func part1(_ input: String) -> CustomStringConvertible {
        let lines = input.toLines()

        let ouptut = lines
            .map({ $0.split(separator: " ") })
            .map({ Instruction(rawValue: $0) })
            .reduce(into: (horizontal: 0, vertical: 0)) { partialResult, instruction in
                switch instruction.direction {
                case .forward:
                    partialResult.horizontal += instruction.change
                case .up:
                    partialResult.vertical -= instruction.change
                case .down:
                    partialResult.vertical += instruction.change
                }
            }

        return ouptut.vertical * ouptut.horizontal
    }

    func part2(_ input: String) -> CustomStringConvertible {
        let lines = input.toLines()

        let ouptut = lines
            .map({ $0.split(separator: " ") })
            .map({ Instruction(rawValue: $0) })
            .reduce(into: (horizontal: 0, vertical: 0, aim: 0)) { partialResult, instruction in
                switch instruction.direction {
                case .forward:
                    partialResult.horizontal += instruction.change
                    partialResult.vertical += partialResult.aim * instruction.change
                case .up:
                    partialResult.aim -= instruction.change
                case .down:
                    partialResult.aim += instruction.change
                }
            }

        return ouptut.vertical * ouptut.horizontal
    }
}

private struct Instruction {
    enum Direction: String { case forward, up, down }

    let direction: Direction
    let change: Int

    init(rawValue: [String.SubSequence]) {
        self.change = Int(rawValue[1])!
        self.direction = Direction(rawValue: String(rawValue[0]))!
    }
}

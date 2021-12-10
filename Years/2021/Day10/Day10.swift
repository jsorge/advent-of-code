//
//  Day10.swift
//  AdventOfCode
//

import Foundation
import AOCCore

final class Day10: Day {
    func part1(_ input: String) -> CustomStringConvertible {
        let lines = input.toLines()

        var corruptingChars = [ChunkClose]()
        for line in lines {
            var openers = [ChunkOpen]()
            for char in line {
                if let open = ChunkOpen(character: char) {
                    openers.append(open)
                } else if let close = ChunkClose(character: char) {
                    let lastOpen = openers.popLast()
                    if lastOpen?.closing != close {
                        corruptingChars.append(close)
                        break
                    }
                }
            }
        }

        let totalValue = corruptingChars.map({ $0.syntaxCheckerValue }).reduce(0, +)
        return totalValue
    }

    func part2(_ input: String) -> CustomStringConvertible {
        let lines = input.toLines()

        var incompleteLineScores = [Int]()
        for line in lines {
            var openers = [ChunkOpen]()
            var corrupted = false
            for char in line {
                if let open = ChunkOpen(character: char) {
                    openers.append(open)
                } else if let close = ChunkClose(character: char) {
                    let lastOpen = openers.popLast()
                    if lastOpen?.closing != close {
                        corrupted = true
                        break
                    }
                }
            }

            guard corrupted == false, openers.count > 0 else { continue }
            let lineValue = openers
                .reversed()
                .map({ $0.closing })
                .reduce(into: 0) { partialResult, close in
                    partialResult *= 5
                    partialResult += close.autocompleteValue
                }

            incompleteLineScores.append(lineValue)
        }

        incompleteLineScores.sort()
        let midIndex = (incompleteLineScores.count - 1) / 2
        return incompleteLineScores[midIndex]
    }
}

private enum ChunkOpen: String {
    case paren = "("
    case bracket = "["
    case brace = "{"
    case angle = "<"

    var closing: ChunkClose {
        switch self {
        case .paren: return .paren
        case .bracket: return .bracket
        case .brace: return .brace
        case .angle: return .angle
        }
    }

    init?(character: Character) {
        guard let open = Self.init(rawValue: String(character)) else { return nil }
        self = open
    }
}

private enum ChunkClose: String {
    case paren = ")"
    case bracket = "]"
    case brace = "}"
    case angle = ">"

    var syntaxCheckerValue: Int {
        switch self {
        case .paren: return 3
        case .bracket: return 57
        case .brace: return 1197
        case .angle: return 25137
        }
    }

    var autocompleteValue: Int {
        switch self {
        case .paren: return 1
        case .bracket: return 2
        case .brace: return 3
        case .angle: return 4
        }
    }

    init?(character: Character) {
        guard let close = Self.init(rawValue: String(character)) else { return nil }
        self = close
    }
}

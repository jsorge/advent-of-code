//
//  Day2.swift
//  AdventOfCode
//

import Foundation
import AOCCore

// https://adventofcode.com/2022/day/2

/*
 Opp  You   Item
 A    X (1)  Rock
 B    Y (2)  Paper
 C    Z (3)  Scissors

 Win:  6
 Lose: 0
 Draw: 3
 */

final class Day2: Day {
    func part1(_ input: String) -> CustomStringConvertible {
        let total = input
            .toLines()
            .filter { $0.isEmpty == false }
            .map {
                let letters = $0.components(separatedBy: " ")
                let opponent = Item(letter: letters[0])
                let you = Item(letter: letters[1])

                var matchPoints = 0
                if opponent == you {
                    matchPoints = 3
                } else if you.winsAgainst(opponent) {
                    matchPoints = 6
                }

                return you.value + matchPoints
            }
            .reduce(0, +)

        return total
    }

    func part2(_ input: String) -> CustomStringConvertible {
        let total = input
            .toLines()
            .filter { $0.isEmpty == false }
            .map {
                let letters = $0.components(separatedBy: " ")
                let opponent = Item(letter: letters[0])

                let outcome = letters[1]
                let you: Item
                let matchPoints: Int
                if outcome == "X" {
                    you = opponent.wouldLose
                    matchPoints = 0
                } else if outcome == "Y" {
                    you = opponent
                    matchPoints = 3
                } else {
                    you = opponent.wouldBeat
                    matchPoints = 6
                }

                return you.value + matchPoints
            }
            .reduce(0, +)

        return total
    }
}

private enum Item: Equatable {
    case rock
    case paper
    case scissors

    var value: Int {
        switch self {
        case .rock: return 1
        case .paper: return 2
        case .scissors: return 3
        }
    }

    var wouldBeat: Item {
        switch self {
        case .rock:
            return .paper
        case .paper:
            return .scissors
        case .scissors:
            return .rock
        }
    }

    var wouldLose: Item {
        switch self {
        case .rock:
            return .scissors
        case .paper:
            return .rock
        case .scissors:
            return .paper
        }
    }

    init(letter: String) {
        if letter == "A" || letter == "X" {
            self = .rock
        } else if letter == "B" || letter == "Y" {
            self = .paper
        } else {
            self = .scissors
        }
    }

    func winsAgainst(_ other: Item) -> Bool {
        switch (self, other) {
        case (.rock, .scissors):
            return true
        case (.paper, .rock):
            return true
        case (.scissors, .paper):
            return true
        default:
            return false
        }
    }
}

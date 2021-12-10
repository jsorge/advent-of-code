//
//  Day7.swift
//  AdventOfCode
//

import Foundation
import AOCCore
import Collections

final class Day7: Day {
    func part1(_ input: String) -> CustomStringConvertible {
        let moves = input.toIntArrayFromLine1()

        var positionCosts = [Int: Int]()
        for pos in 0...moves.max()! {
            let positionCost = moves
                .map({ abs($0 - pos) })
                .reduce(0, +)
            positionCosts[pos] = positionCost
        }

        let leastExpensive = positionCosts.sorted(by: { $0.value < $1.value }).first!
        return leastExpensive.value
    }

    func part2(_ input: String) -> CustomStringConvertible {
        let moves = input.toIntArrayFromLine1()

        var positionCosts = [Int: Int]()
        for pos in 0...moves.max()! {
            guard pos > 0 else { continue }
            let positionCost = moves
                .map({
                    let steps = abs($0 - pos)
                    let total = steps * (steps + 1) / 2
                    return total
                })
                .reduce(0, +)
            positionCosts[pos] = positionCost
        }

        let leastExpensive = positionCosts.sorted(by: { $0.value < $1.value }).first!
        return leastExpensive.value
    }
}

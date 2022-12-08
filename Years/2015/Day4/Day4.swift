//
//  Day4.swift
//  AdventOfCode
//

import Foundation
import AOCCore
import SwiftHash

// https://adventofcode.com/2015/day/4

final class Day4: Day {
    func part1(_ input: String) -> CustomStringConvertible {
        // This took 29 seconds to compute from the real input
        for i in 0 ... Int.max {
            let test = "\(input)\(i)"
            if MD5(test).hasPrefix("00000") {
                return i
            }
        }

        return -1
    }

    func part2(_ input: String) -> CustomStringConvertible {
        // This took 332.316 seconds to compute from the real input
        // Not great, Bob!
        for i in 0 ... Int.max {
            let test = "\(input)\(i)"
            if MD5(test).hasPrefix("000000") {
                return i
            }
        }

        return -1
    }
}

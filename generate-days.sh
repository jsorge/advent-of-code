#!/bin/bash

YEAR=$1

mkdir "Years/${YEAR}"

for DAY in {1..25}
do

mkdir "Years/${YEAR}/Day${DAY}"

    cat <<EOT > Years/${YEAR}/Day${DAY}/Day${DAY}.swift
//
//  Day${DAY}.swift
//  AdventOfCode
//

import Foundation
import AOCCore

final class Day${DAY}: Day {
    func part1(_ input: String) -> CustomStringConvertible {
        return 0
    }

    func part2(_ input: String) -> CustomStringConvertible {
        return 0
    }
}
EOT

    cat <<EOT > Years/${YEAR}/Day${DAY}/Day${DAY}Tests.swift
//
//  Day${DAY}Tests.swift
//  Day${DAY}Tests
//

import XCTest
@testable import AOC${YEAR}
import TestingSupport

private let sampleInput = """
"""

class Day${DAY}Tests: XCTestCase {
    let day = Day${DAY}()

    func testPart1() throws {
        XCTAssertEqual(0, day.part1(sampleInput) as? Int)

        let inputFromFile = try Loader.loadDay("${DAY}", from: .module)
        let result = day.part1(inputFromFile)
        printResult(result)
    }

    func testPart2() throws {
        XCTAssertEqual(0, day.part2(sampleInput) as? Int)

        let inputFromFile = try Loader.loadDay("${DAY}", from: .module)
        let result = day.part2(inputFromFile)
        printResult(result)
    }
}
EOT

touch "Years/${YEAR}/Day${DAY}/Day${DAY}.input"

done

//
//  Day8Tests.swift
//  Day8Tests
//

import XCTest
@testable import AOC2022
import TestingSupport

private let sampleInput = """
30373
25512
65332
33549
35390
"""

class Day8Tests: XCTestCase {
    let day = Day8()

    func testPart1() throws {
        XCTAssertEqual(21, day.part1(sampleInput) as? Int)

        let inputFromFile = try Loader.loadDay("8", from: .module)
        let result = day.part1(inputFromFile)
        printResult(result)
    }

    func testPart2() throws {
        XCTAssertEqual(8, day.part2(sampleInput) as? Int)

        let inputFromFile = try Loader.loadDay("8", from: .module)
        let result = day.part2(inputFromFile)
        printResult(result)
    }
}

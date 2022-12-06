//
//  Day6Tests.swift
//  Day6Tests
//

import XCTest
@testable import AOC2022
import TestingSupport

private let sampleInput = """
mjqjpqmgbljsphdztnvjfqwrcgsmlb
"""

class Day6Tests: XCTestCase {
    let day = Day6()

    func testPart1() throws {
        XCTAssertEqual(7, day.part1(sampleInput) as? Int)

        let inputFromFile = try Loader.loadDay("6", from: .module)
        let result = day.part1(inputFromFile)
        printResult(result)
    }

    func testPart2() throws {
        XCTAssertEqual(19, day.part2(sampleInput) as? Int)

        let inputFromFile = try Loader.loadDay("6", from: .module)
        let result = day.part2(inputFromFile)
        printResult(result)
    }
}

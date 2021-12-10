//
//  Day6Tests.swift
//  Day6Tests
//

import XCTest
@testable import AOC2021
import TestingSupport

private let sampleInput = """
3,4,3,1,2
"""

class Day6Tests: XCTestCase {
    let day = Day6()

    func testPart1() throws {
        XCTAssertEqual(5934, day.part1(sampleInput) as? Int)

        let inputFromFile = try Loader.loadDay("6", from: .module)
        let result = day.part1(inputFromFile)
        printResult(result)
    }

    func testPart2() throws {
        XCTAssertEqual(26984457539, day.part2(sampleInput) as? Int)

        let inputFromFile = try Loader.loadDay("6", from: .module)
        let result = day.part2(inputFromFile)
        printResult(result)
    }
}

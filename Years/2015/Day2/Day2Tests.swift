//
//  Day2Tests.swift
//  Day2Tests
//

import XCTest
@testable import AOC2015
import TestingSupport

private let sampleInput = """
2x3x4
"""

class Day2Tests: XCTestCase {
    let day = Day2()

    func testPart1() throws {
        XCTAssertEqual(58, day.part1(sampleInput) as? Int)

        let inputFromFile = try Loader.loadDay("2", from: .module)
        let result = day.part1(inputFromFile)
        printResult(result)
    }

    func testPart2() throws {
        XCTAssertEqual(34, day.part2(sampleInput) as? Int)

        let inputFromFile = try Loader.loadDay("2", from: .module)
        let result = day.part2(inputFromFile)
        printResult(result)
    }
}

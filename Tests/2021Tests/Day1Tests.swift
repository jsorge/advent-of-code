//
//  Day1Tests.swift
//  Day1Tests
//

import XCTest
@testable import AOC2021
import TestingSupport

private let input = """
199
200
208
210
200
207
240
269
260
263
"""

class Day1Tests: XCTestCase {
    let day = Day1()

    func testPart1() throws {
        let output = day.part1(input)
        XCTAssertEqual(7, output as? Int)

        let inputFromFile = try Loader.loadDay("1", from: .module)
        let result = day.part1(inputFromFile)
        printResult(result)
    }

    func testPart2() throws {
        let output = day.part2(input)
        XCTAssertEqual(5, output as? Int)

        let inputFromFile = try Loader.loadDay("1", from: .module)
        let result = day.part2(inputFromFile)
        printResult(result)
    }
}

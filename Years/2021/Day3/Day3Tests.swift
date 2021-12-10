//
//  Day3Tests.swift
//  Day3Tests
//

import XCTest
@testable import AOC2021
import TestingSupport

private let sampleInput = """
00100
11110
10110
10111
10101
01111
00111
11100
10000
11001
00010
01010
"""

class Day3Tests: XCTestCase {
    let day = Day3()

    func testPart1() throws {
        XCTAssertEqual(198, day.part1(sampleInput) as? Int)

        let inputFromFile = try Loader.loadDay("3", from: .module)
        let result = day.part1(inputFromFile)
        printResult(result)
    }

    func testPart2() throws {
        XCTAssertEqual(230, day.part2(sampleInput) as? Int)

        let inputFromFile = try Loader.loadDay("3", from: .module)
        let result = day.part2(inputFromFile)
        printResult(result)
    }
}

//
//  Day2Tests.swift
//  Day2Tests
//

import XCTest
@testable import AOC2022
import TestingSupport

private let sampleInput = """
A Y
B X
C Z
"""

class Day2Tests: XCTestCase {
    let day = Day2()

    func testPart1() throws {
        XCTAssertEqual(15, day.part1(sampleInput) as? Int)

        let inputFromFile = try Loader.loadDay("2", from: .module)
        let result = day.part1(inputFromFile)
        printResult(result)
    }

    func testPart2() throws {
        XCTAssertEqual(12, day.part2(sampleInput) as? Int)

        let inputFromFile = try Loader.loadDay("2", from: .module)
        let result = day.part2(inputFromFile)
        printResult(result)
    }
}

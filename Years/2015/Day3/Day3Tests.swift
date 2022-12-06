//
//  Day3Tests.swift
//  Day3Tests
//

import XCTest
@testable import AOC2015
import TestingSupport

private let sampleInput = """
"""

class Day3Tests: XCTestCase {
    let day = Day3()

    func testPart1() throws {
        XCTAssertEqual(0, day.part1(sampleInput) as? Int)

        let inputFromFile = try Loader.loadDay("3", from: .module)
        let result = day.part1(inputFromFile)
        printResult(result)
    }

    func testPart2() throws {
        XCTAssertEqual(0, day.part2(sampleInput) as? Int)

        let inputFromFile = try Loader.loadDay("3", from: .module)
        let result = day.part2(inputFromFile)
        printResult(result)
    }
}

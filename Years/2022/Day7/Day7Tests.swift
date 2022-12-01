//
//  Day7Tests.swift
//  Day7Tests
//

import XCTest
@testable import AOC2022
import TestingSupport

private let sampleInput = """
"""

class Day7Tests: XCTestCase {
    let day = Day7()

    func testPart1() throws {
        XCTAssertEqual(0, day.part1(sampleInput) as? Int)

        let inputFromFile = try Loader.loadDay("7", from: .module)
        let result = day.part1(inputFromFile)
        printResult(result)
    }

    func testPart2() throws {
        XCTAssertEqual(0, day.part2(sampleInput) as? Int)

        let inputFromFile = try Loader.loadDay("7", from: .module)
        let result = day.part2(inputFromFile)
        printResult(result)
    }
}

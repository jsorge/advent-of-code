//
//  Day13Tests.swift
//  Day13Tests
//

import XCTest
@testable import AOC2021
import TestingSupport

private let sampleInput = """
"""

class Day13Tests: XCTestCase {
    let day = Day13()

    func testPart1() throws {
        XCTAssertEqual(0, day.part1(sampleInput) as? Int)

        let inputFromFile = try Loader.loadDay("13", from: .module)
        let result = day.part1(inputFromFile)
        printResult(result)
    }

    func testPart2() throws {
        XCTAssertEqual(0, day.part2(sampleInput) as? Int)

        let inputFromFile = try Loader.loadDay("13", from: .module)
        let result = day.part2(inputFromFile)
        printResult(result)
    }
}

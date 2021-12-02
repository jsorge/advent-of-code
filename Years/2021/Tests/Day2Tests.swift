//
//  Day2Tests.swift
//  Day2Tests
//

import XCTest
@testable import AOC2021
import TestingSupport

private let sampleInput = """
forward 5
down 5
forward 8
up 3
down 8
forward 2
"""

class Day2Tests: XCTestCase {
    let day = Day2()

    func testPart1() throws {
        XCTAssertEqual(150, day.part1(sampleInput) as? Int)

        let inputFromFile = try Loader.loadDay("2", from: .module)
        let result = day.part1(inputFromFile)
        printResult(result)
    }

    func testPart2() throws {
        XCTAssertEqual(900, day.part2(sampleInput) as? Int)

        let inputFromFile = try Loader.loadDay("2", from: .module)
        let result = day.part2(inputFromFile)
        printResult(result)
    }
}

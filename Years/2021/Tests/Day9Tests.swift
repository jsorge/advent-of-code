//
//  Day9Tests.swift
//  Day9Tests
//

import XCTest
@testable import AOC2021
import TestingSupport

private let sampleInput = """
2199943210
3987894921
9856789892
8767896789
9899965678
"""

class Day9Tests: XCTestCase {
    let day = Day9()

    func testPart1() throws {
        XCTAssertEqual(15, day.part1(sampleInput) as? Int)

        let inputFromFile = try Loader.loadDay("9", from: .module)
        let result = day.part1(inputFromFile)
        printResult(result)
    }

    func testPart2() throws {
        XCTAssertEqual(1134, day.part2(sampleInput) as? Int)

        let inputFromFile = try Loader.loadDay("9", from: .module)
        let result = day.part2(inputFromFile)
        printResult(result)
    }
}

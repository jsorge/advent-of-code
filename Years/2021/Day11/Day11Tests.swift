//
//  Day11Tests.swift
//  Day11Tests
//

import XCTest
@testable import AOC2021
import TestingSupport

private let sampleInput = """
5483143223
2745854711
5264556173
6141336146
6357385478
4167524645
2176841721
6882881134
4846848554
5283751526
"""

class Day11Tests: XCTestCase {
    let day = Day11()

    func testPart1() throws {
        XCTAssertEqual(1656, day.part1(sampleInput) as? Int)

        let inputFromFile = try Loader.loadDay("11", from: .module)
        let result = day.part1(inputFromFile)
        printResult(result)
    }

    func testPart2() throws {
        XCTAssertEqual(195, day.part2(sampleInput) as? Int)

        let inputFromFile = try Loader.loadDay("11", from: .module)
        let result = day.part2(inputFromFile)
        printResult(result)
    }
}

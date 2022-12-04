//
//  Day4Tests.swift
//  Day4Tests
//

import XCTest
@testable import AOC2022
import TestingSupport

private let sampleInput = """
2-4,6-8
2-3,4-5
5-7,7-9
2-8,3-7
6-6,4-6
2-6,4-8
"""

class Day4Tests: XCTestCase {
    let day = Day4()

    func testPart1() throws {
        XCTAssertEqual(2, day.part1(sampleInput) as? Int)

        let inputFromFile = try Loader.loadDay("4", from: .module)
        let result = day.part1(inputFromFile)
        printResult(result)
    }

    func testPart2() throws {
        XCTAssertEqual(4, day.part2(sampleInput) as? Int)

        let inputFromFile = try Loader.loadDay("4", from: .module)
        let result = day.part2(inputFromFile)
        printResult(result)
    }
}

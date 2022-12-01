//
//  Day5Tests.swift
//  Day5Tests
//

import XCTest
@testable import AOC2021
import TestingSupport

private let sampleInput = """
0,9 -> 5,9
8,0 -> 0,8
9,4 -> 3,4
2,2 -> 2,1
7,0 -> 7,4
6,4 -> 2,0
0,9 -> 2,9
3,4 -> 1,4
0,0 -> 8,8
5,5 -> 8,2
"""

class Day5Tests: XCTestCase {
    let day = Day5()

    func testPart1() throws {
        XCTAssertEqual(5, day.part1(sampleInput) as? Int)

        let inputFromFile = try Loader.loadDay("5", from: .module)
        let result = day.part1(inputFromFile)
        printResult(result)
    }

    func testPart2() throws {
        XCTAssertEqual(12, day.part2(sampleInput) as? Int)

//        let inputFromFile = try Loader.loadDay("5", from: .module)
//        let result = day.part2(inputFromFile)
//        printResult(result)
    }
}

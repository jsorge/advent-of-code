//
//  Day5Tests.swift
//  Day5Tests
//

import XCTest
@testable import AOC2022
import TestingSupport

private let sampleInput = """
    [D]
[N] [C]
[Z] [M] [P]
 1   2   3

move 1 from 2 to 1
move 3 from 1 to 3
move 2 from 2 to 1
move 1 from 1 to 2
"""

class Day5Tests: XCTestCase {
    let day = Day5()

    func testPart1() throws {
        XCTAssertEqual("CMZ", day.part1(sampleInput) as! String)

        let inputFromFile = try Loader.loadDay("5", from: .module)
        let result = day.part1(inputFromFile)
        printResult(result)
    }

    func testPart2() throws {
        XCTAssertEqual("MCD", day.part2(sampleInput) as! String)

        let inputFromFile = try Loader.loadDay("5", from: .module)
        let result = day.part2(inputFromFile)
        printResult(result)
    }
}

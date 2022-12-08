//
//  Day4Tests.swift
//  Day4Tests
//

import XCTest
@testable import AOC2015
import TestingSupport

private let sampleInput = "abcdef"
private let input = "iwrupvqb"

class Day4Tests: XCTestCase {
    let day = Day4()

    func testPart1() throws {
        XCTAssertEqual(609043, day.part1(sampleInput) as? Int)

        let result = day.part1(input)
        printResult(result)
    }

    func testPart2() throws {
        let result = day.part2(input)
        printResult(result)
    }
}

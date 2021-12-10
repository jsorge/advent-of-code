//
//  Day10Tests.swift
//  Day10Tests
//

import XCTest
@testable import AOC2021
import TestingSupport

private let sampleInput = """
[({(<(())[]>[[{[]{<()<>>
[(()[<>])]({[<{<<[]>>(
{([(<{}[<>[]}>{[]{[(<()>
(((({<>}<{<{<>}{[]{[]{}
[[<[([]))<([[{}[[()]]]
[{[{({}]{}}([{[{{{}}([]
{<[[]]>}<{[{[{[]{()[[[]
[<(<(<(<{}))><([]([]()
<{([([[(<>()){}]>(<<{{
<{([{{}}[<[[[<>{}]]]>[]]
"""

class Day10Tests: XCTestCase {
    let day = Day10()

    func testPart1() throws {
        XCTAssertEqual(26397, day.part1(sampleInput) as? Int)

        let inputFromFile = try Loader.loadDay("10", from: .module)
        let result = day.part1(inputFromFile)
        printResult(result)
    }

    func testPart2() throws {
        XCTAssertEqual(288957, day.part2(sampleInput) as? Int)

        let inputFromFile = try Loader.loadDay("10", from: .module)
        let result = day.part2(inputFromFile)
        printResult(result)
    }

}

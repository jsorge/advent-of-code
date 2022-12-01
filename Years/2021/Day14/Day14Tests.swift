//
//  Day14Tests.swift
//  Day14Tests
//

import XCTest
@testable import AOC2021
import TestingSupport

private let sampleInput = """
NNCB

CH -> B
HH -> N
CB -> H
NH -> C
HB -> C
HC -> B
HN -> C
NN -> C
BH -> H
NC -> B
NB -> B
BN -> B
BB -> N
BC -> B
CC -> N
CN -> C
"""

class Day14Tests: XCTestCase {
    let day = Day14()

    func testPart1() throws {
        XCTAssertEqual(1588, day.part1(sampleInput) as? Int)

        let inputFromFile = try Loader.loadDay("14", from: .module)
        let result = day.part1(inputFromFile)
        printResult(result)
    }

    func testPart2() throws {
        XCTAssertEqual(2188189693529, day.part2(sampleInput) as? Int)

//        let inputFromFile = try Loader.loadDay("14", from: .module)
//        let result = day.part2(inputFromFile)
//        printResult(result)
    }
}

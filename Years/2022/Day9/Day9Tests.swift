//
//  Day9Tests.swift
//  Day9Tests
//

import XCTest
@testable import AOC2022
import TestingSupport

class Day9Tests: XCTestCase {
    let day = Day9()

    func testPart1() throws {
        let sampleInput = """
        R 4
        U 4
        L 3
        D 1
        R 4
        D 1
        L 5
        R 2
        """
        XCTAssertEqual(13, day.part1(sampleInput) as? Int)

        let inputFromFile = try Loader.loadDay("9", from: .module)
        let result = day.part1(inputFromFile)
        printResult(result)

        XCTAssertEqual(6339, result as? Int)
    }

    func testPart2() throws {
        let sampleInput = """
        R 5
        U 8
        L 8
        D 3
        R 17
        D 10
        L 25
        U 20
        """
        XCTAssertEqual(36, day.part2(sampleInput) as? Int)

        let inputFromFile = try Loader.loadDay("9", from: .module)
        let result = day.part2(inputFromFile)
        printResult(result)

        XCTAssertGreaterThan(result as! Int, 2532)
    }
}

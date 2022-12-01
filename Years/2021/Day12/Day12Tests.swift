//
//  Day12Tests.swift
//  Day12Tests
//

import XCTest
@testable import AOC2021
import TestingSupport

private let sampleInput = """
fs-end
he-DX
fs-he
start-DX
pj-DX
end-zg
zg-sl
zg-pj
pj-he
RW-he
fs-DX
pj-RW
zg-RW
start-pj
he-WI
zg-he
pj-fs
start-RW
"""

class Day12Tests: XCTestCase {
    let day = Day12()

    func testPart1() throws {
        XCTAssertEqual(226, day.part1(sampleInput) as? Int)

//        let inputFromFile = try Loader.loadDay("12", from: .module)
//        let result = day.part1(inputFromFile)
//        printResult(result)
    }

    func testPart2() throws {
        XCTAssertEqual(0, day.part2(sampleInput) as? Int)

//        let inputFromFile = try Loader.loadDay("12", from: .module)
//        let result = day.part2(inputFromFile)
//        printResult(result)
    }
}

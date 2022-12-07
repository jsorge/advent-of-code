//
//  Day7Tests.swift
//  Day7Tests
//

import XCTest
@testable import AOC2022
import TestingSupport

private let sampleInput = """
$ cd /
$ ls
dir a
14848514 b.txt
8504156 c.dat
dir d
$ cd a
$ ls
dir e
29116 f
2557 g
62596 h.lst
$ cd e
$ ls
584 i
$ cd ..
$ cd ..
$ cd d
$ ls
4060174 j
8033020 d.log
5626152 d.ext
7214296 k
"""

class Day7Tests: XCTestCase {
    let day = Day7()

    func testPart1() throws {
        XCTAssertEqual(95437, day.part1(sampleInput) as? Int)

        let inputFromFile = try Loader.loadDay("7", from: .module)
        let result = day.part1(inputFromFile)
        printResult(result)
    }

    func testPart2() throws {
        XCTAssertEqual(24933642, day.part2(sampleInput) as? Int)

        let inputFromFile = try Loader.loadDay("7", from: .module)
        let result = day.part2(inputFromFile)
        printResult(result)
    }
}

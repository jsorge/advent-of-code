//
//  Day8Tests.swift
//  Day8Tests
//

import XCTest
@testable import AOC2021
import TestingSupport

private let sampleInput = """
be cfbegad cbdgef fgaecd cgeb fdcge agebfd fecdb fabcd edb | fdgacbe cefdb cefbgd gcbe
edbfga begcd cbg gc gcadebf fbgde acbgfd abcde gfcbed gfec | fcgedb cgb dgebacf gc
fgaebd cg bdaec gdafb agbcfd gdcbef bgcad gfac gcb cdgabef | cg cg fdcagb cbg
fbegcd cbd adcefb dageb afcb bc aefdc ecdab fgdeca fcdbega | efabcd cedba gadfec cb
aecbfdg fbg gf bafeg dbefa fcge gcbea fcaegb dgceab fcbdga | gecf egdcabf bgf bfgea
fgeab ca afcebg bdacfeg cfaedg gcfdb baec bfadeg bafgc acf | gebdcfa ecba ca fadegcb
dbcfg fgd bdegcaf fgec aegbdf ecdfab fbedc dacgb gdcebf gf | cefg dcbef fcge gbcadfe
bdfegc cbegaf gecbf dfcage bdacg ed bedf ced adcbefg gebcd | ed bcgafe cdgba cbgef
egadfb cdbfeg cegd fecab cgb gbdefca cg fgcdab egfdb bfceg | gbdfcae bgc cg cgb
gcafb gcf dcaebfg ecagb gf abcdeg gaef cafbge fdbac fegbdc | fgae cfgab fg bagce
"""

class Day8Tests: XCTestCase {
    let day = Day8()

    func testPart1() throws {
        XCTAssertEqual(26, day.part1(sampleInput) as? Int)

        let inputFromFile = try Loader.loadDay("8", from: .module)
        let result = day.part1(inputFromFile)
        printResult(result)
    }

    func testPart2() throws {
        XCTAssertEqual(61229, day.part2(sampleInput) as? Int)

        let inputFromFile = try Loader.loadDay("8", from: .module)
        let result = day.part2(inputFromFile)
        printResult(result)
    }
}

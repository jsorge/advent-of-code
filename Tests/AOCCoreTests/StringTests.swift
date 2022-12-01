//
//  File.swift
//  
//
//  Created by Jared Sorge on 12/1/22.
//

import Foundation
import AOCCore
import XCTest

final class StringTests: XCTestCase {
    func testParsingLinesDoesNotOmitBlanks() {
        let input = """
        new line

        another new line
        """

        let lines = input.toLines()
        XCTAssertEqual(3, lines.count, "Should have 3 lines, got \(lines.count)")
    }
}

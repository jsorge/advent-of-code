import Foundation
import AOCCore
import XCTest

private let inputLines = """
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

final class RegexTests: XCTestCase {
    func testRegexParser() {
        let regex = NSRegularExpression(#"^((start|end)?|((.)(.)))-((start|end)?|((.)(.)))$"#)
        for line in inputLines.split(separator: "\n").map({ String($0) }) {
            let matches = regex.allMatches(in: line)
            print(matches)
        }
    }
}

//
//  Day3.swift
//  AdventOfCode
//

import Foundation
import AOCCore

final class Day3: Day {
    func part1(_ input: String) -> CustomStringConvertible {
        let lines = input.toLines()

        var bitBag = BitBag(numberOfBits: lines.first!.count)
        for line in lines {
            bitBag.updateCount(from: line)
        }

        let gamma = bitBag.intValue
        let epsilon = bitBag.invertedIntValue

        return gamma * epsilon
    }

    func part2(_ input: String) -> CustomStringConvertible {
        let bitLines = input.toLines().map({ line in line.map({ Bit(substring: $0) }) })

        // oxygen ratings iterate bits left to right and eliminate the least common bit
        var oxygenRatings = bitLines
        for i in 0..<bitLines.first!.count {
            oxygenRatings = oxygenRatings.filterForMostCommonBits(at: i)

            if oxygenRatings.count == 1 {
                break
            }
        }

        // CO2 scrubber ratings invert that search
        var co2Ratings = bitLines
        for i in 0..<bitLines.first!.count {
            co2Ratings = co2Ratings.filterForLeastCommonBits(at: i)

            if co2Ratings.count == 1 {
                break
            }
        }

        let oxygen = oxygenRatings.first!.toInt()
        let co2 = co2Ratings.first!.toInt()
        return oxygen * co2
    }
}

private struct BitCounter {
    var countOfOns = 0
    var countOfOffs = 0

    var stringRepresentation: String {
        return countOfOns > countOfOffs ? "1" : "0"
    }

    var invertedStringRepresentation: String {
        return stringRepresentation == "1" ? "0" : "1"
    }
}

private struct BitBag {
    var bits: [BitCounter]

    init(numberOfBits: Int) {
        self.bits = Array<BitCounter>(repeating: BitCounter(), count: numberOfBits)
    }

    mutating func updateCount(from string: String) {
        for (index, var bit) in bits.enumerated() {
            let value = (string as NSString).substring(with: NSMakeRange(index, 1))
            if value == "0" {
                bit.countOfOffs += 1
            } else {
                bit.countOfOns += 1
            }
            self.bits[index] = bit
        }
    }

    var intValue: Int {
        return Int(binaryString, radix: 2) ?? -1
    }

    var invertedIntValue: Int {
        return Int(invertedBinaryString, radix: 2) ?? -1
    }

    private var binaryString: String {
        return bits.map({ $0.stringRepresentation }).joined(separator: "")
    }

    private var invertedBinaryString: String {
        return bits.map({ $0.invertedStringRepresentation }).joined(separator: "")
    }
}

private typealias Bit = Bool

private extension Bit {
    init(substring: String.Element) {
        if substring == "1" {
            self = true
        } else {
            self = false
        }
    }

    var stringRepresentation: String {
        return self == true ? "1" : "0"
    }
}

private extension Array where Element == [Bit] {
    func filterForMostCommonBits(at location: Int) -> [[Bit]] {
        let separated = self.reduce(into: (off: [[Bit]](), on: [[Bit]]()), { partialResult, line in
            if line[location] == true {
                partialResult.on.append(line)
            } else {
                partialResult.off.append(line)
            }
        })

        if separated.on.count == separated.off.count {
            return separated.on
        } else {
            return separated.on.count > separated.off.count ? separated.on : separated.off
        }
    }

    func filterForLeastCommonBits(at location: Int) -> [[Bit]] {
        let separated = self.reduce(into: (off: [[Bit]](), on: [[Bit]]()), { partialResult, line in
            if line[location] == true {
                partialResult.on.append(line)
            } else {
                partialResult.off.append(line)
            }
        })

        if separated.on.count == separated.off.count {
            return separated.off
        } else {
            return separated.on.count > separated.off.count ? separated.off : separated.on
        }
    }
}

private extension Array where Element == Bit {
    func toInt() -> Int {
        let textual = self.map({ $0.stringRepresentation }).joined(separator: "")
        return Int(textual, radix: 2) ?? -1
    }
}

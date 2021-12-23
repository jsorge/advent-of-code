//
//  Day22.swift
//  AdventOfCode
//

import Foundation
import AOCCore

// https://adventofcode.com/2021/day/22

final class Day22: Day {
    func part1(_ input: String) -> CustomStringConvertible {
        let cubes = input
            .toLines()
            .dropLast(2)
            .map({ Instruction(line: $0) })
            .reduce(into: Set<Cuboid>()) { cuboids, inst in
                guard inst.cuboid.isSmall else { return }
                
                if inst.command {
                    if cuboids.isEmpty {
                        cuboids.insert(inst.cuboid)
                    } else {
                        cuboids = Set(cuboids.flatMap({ $0.unionWith(inst.cuboid) }))
                    }
                } else {
                    cuboids = Set(cuboids.flatMap({ $0.unionWith(inst.cuboid) }))
                    cuboids.remove(inst.cuboid)
                }
            }
            .map({ $0.points })
            .reduce(0, +)

        return cubes
    }

    func part2(_ input: String) -> CustomStringConvertible {
        let cubes = input
            .toLines()
            .map({ Instruction(line: $0) })
            .reduce(into: Set<Cuboid>()) { cuboids, inst in
                if inst.command {
                    if cuboids.isEmpty {
                        cuboids.insert(inst.cuboid)
                    } else {
                        cuboids = Set(cuboids.flatMap({ $0.unionWith(inst.cuboid) }))
                    }
                } else {
                    cuboids = Set(cuboids.flatMap({ $0.unionWith(inst.cuboid) }))
                    cuboids.remove(inst.cuboid)
                }
            }
            .map({ $0.points })
            .reduce(0, +)

        return cubes
    }
}

private struct Instruction {
    let command: Bool
    let cuboid: Cuboid

    init(line: String) {
        let regex = NSRegularExpression(#"^(..\w?) x=(.*),y=(.*),z=(.*)$"#)
        let splits = regex.allMatches(in: line)

        self.command = splits[1] == "on" ? true : false
        let xRange = ClosedRange<Int>(string: splits[2])
        let yRange = ClosedRange<Int>(string: splits[3])
        let zRange = ClosedRange<Int>(string: splits[4])
        self.cuboid = Cuboid(xRange: xRange, yRange: yRange, zRange: zRange)
    }
}

private struct Cuboid: Hashable {
    let xRange: ClosedRange<Int>
    let yRange: ClosedRange<Int>
    let zRange: ClosedRange<Int>
}

private extension Cuboid {
    var points: Int { xRange.magnitude * yRange.magnitude * zRange.magnitude }

    static var small: Cuboid { Cuboid(xRange: -50...50, yRange: -50...50, zRange: -50...50) }
    var isSmall: Bool {
        Cuboid.small.isSuperSetOf(self)
    }

    func isSuperSetOf(_ other: Cuboid) -> Bool {
        return xRange.isSupersetOf(other.xRange) && yRange.isSupersetOf(other.yRange) && zRange.isSupersetOf(other.zRange)
    }

    func intersectsWith(_ other: Cuboid) -> Bool {
        xRange.overlaps(other.xRange) && yRange.overlaps(other.yRange) && zRange.overlaps(other.zRange)
    }

    func unionWith(_ other: Cuboid) -> Set<Cuboid> {
        guard intersectsWith(other) else { return [self, other] }
        guard other.isSuperSetOf(self) == false else { return [other] }

        var cuboids = Set<Cuboid>()
        cuboids.insert(other)

        let xRanges = xRange.split(over: other.xRange)
        let yRanges = yRange.split(over: other.yRange)
        let zRanges = zRange.split(over: other.zRange)

        for xRange in xRanges {
            for yRange in yRanges {
                for zRange in zRanges {
                    let cuboid = Cuboid(xRange: xRange, yRange: yRange, zRange: zRange)
                    if other.isSuperSetOf(cuboid) { continue }
                    cuboids.insert(cuboid)
                }
            }
        }

        return cuboids
    }
}

private extension ClosedRange {
    func isSupersetOf(_ other: ClosedRange) -> Bool {
        return lowerBound <= other.lowerBound && upperBound >= other.upperBound
    }
}

private extension ClosedRange where Bound == Int {
    var magnitude: Int { abs(upperBound - lowerBound + 1) }

    init(string: String) {
        let regex = NSRegularExpression(#"(-?\d*)..(-?\d*)"#)
        let matches = regex.allMatches(in: string)
        let first = Int(matches[1])!
        let second = Int(matches[2])!

        let minMax = [first, second].minAndMax(by: { $0 < $1 })!

        self = minMax.min...minMax.max
    }

    func split(over other: Self) -> Set<Self> {
        if other.isSupersetOf(self) {
            return [self]
        } else if lowerBound < other.lowerBound, upperBound > other.upperBound {
            return [
                lowerBound...other.lowerBound - 1,
                other,
                other.upperBound + 1 ... upperBound,
            ]
        } else if other.lowerBound <= lowerBound {
            return [
                lowerBound...other.upperBound,
                other.upperBound + 1 ... upperBound,
            ]
        } else {
            return [
                lowerBound...other.lowerBound - 1,
                other.lowerBound...upperBound
            ]
        }
    }
}

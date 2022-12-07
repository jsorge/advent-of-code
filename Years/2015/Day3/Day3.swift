//
//  Day3.swift
//  AdventOfCode
//

import Foundation
import AOCCore
import Algorithms

// https://adventofcode.com/2015/day/3

final class Day3: Day {
    func part1(_ input: String) -> CustomStringConvertible {
        var points = [Point: Int]()

        var currentPoint = Point(x: 0, y: 0)
        points[currentPoint] = 1

        for instruction in input.trimmingCharacters(in: .newlines) {
            let nextPoint = currentPoint.applyingInstruction(instruction)
            points[nextPoint, default: 0] += 1
            currentPoint = nextPoint
        }

        return points.keys.count
    }

    func part2(_ input: String) -> CustomStringConvertible {
        var points = [Point: Int]()

        var santaPoint = Point(x: 0, y: 0)
        var roboPoint = Point(x: 0, y: 0)
        points[santaPoint] = 2

        for instruction in input.chunks(ofCount: 2) {
            let nextSanta = santaPoint.applyingInstruction(instruction.first!)
            let nextRobo = roboPoint.applyingInstruction(instruction.last!)

            points[nextSanta, default: 0] += 1
            points[nextRobo, default: 0] += 1

            santaPoint = nextSanta
            roboPoint = nextRobo
        }

        return points.keys.count
    }
}

private extension Point {
    func applyingInstruction(_ instruction: Character) -> Point {
        var newPoint = self

        if instruction == "^" {
            newPoint.y += 1
        } else if instruction == "<" {
            newPoint.x -= 1
        } else if instruction == ">" {
            newPoint.x += 1
        } else if instruction == "v" {
            newPoint.y -= 1
        }

        return newPoint
    }
}

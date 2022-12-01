//
//  Day5.swift
//  AdventOfCode
//

import Foundation
import AOCCore

final class Day5: Day {
    func part1(_ input: String) -> CustomStringConvertible {
        let lines = input.toLines()

        let vents = lines
            .map({ Vent(string: $0) })

        let width = vents.map({ max($0.start.x, $0.end.x ) }).sorted(by: { $0 > $1 }).first! + 1
        let height = vents.map({ max($0.start.y, $0.end.y ) }).sorted(by: { $0 > $1 }).first! + 1
        var map = Map(width: width, height: height)

        vents
            .filter({ $0.isStraight })
            .forEach({ map.addVent($0) })

        return map.overlappingPoints.count
    }

    func part2(_ input: String) -> CustomStringConvertible {
        let lines = input.toLines()

        let points = lines
            .map({ Vent(string: $0) })

        let width = points.map({ max($0.start.x, $0.end.x ) }).sorted(by: { $0 > $1 }).first! + 1
        let height = points.map({ max($0.start.y, $0.end.y ) }).sorted(by: { $0 > $1 }).first! + 1
        var map = Map(width: width, height: height)

        points
            .filter({ $0.isStraight || $0.is45DegreeAngle  })
            .forEach({ map.addVent($0) })

        print(map.debugDescription)

        return map.overlappingPoints.count
    }
}

private struct Map {
    let width: Int
    let height: Int

    private var points = [Point: Int]()

    init(width: Int, height: Int) {
        self.width = width
        self.height = height
    }

    mutating func addVent(_ vent: Vent) {
        vent.allPoints
            .forEach({ self.points[$0, default: 0] += 1 })
    }

    var overlappingPoints: [Point] {
        return points
            .filter({ $0.value > 1 })
            .map({ $0.key })
    }

    var debugDescription: String {
        var mapText = ""

        for row in 0...height {
            for col in 0...width {
                let point = Point(x: col, y: row)
                let value = points[point]
                mapText += value == nil ? "." : "\(value!)"
            }
            mapText += "\n"
        }

        return mapText
    }
}

private struct Vent {
    let start: Point
    let end: Point

    init(string: String) {
        let regex = NSRegularExpression("^(\\d+),(\\d+) -> (\\d+),(\\d+)$")
        let matchedValues = regex
            .allMatches(in: string)
            .dropFirst()
            .compactMap({ Int($0) })

        self.start = Point(x: matchedValues[0], y: matchedValues[1])
        self.end = Point(x: matchedValues[2], y: matchedValues[3])
    }

    var allPoints: [Point] {
        if isStraight {
            let points: [Point]

            if isVertical {
                points = straightRange!
                    .map({ Point(x: start.x, y: $0) })
            } else {
                points = straightRange!
                    .map({ Point(x: $0, y: start.y) })
            }

            return points
        } else if is45DegreeAngle {
            var points = [start]

            

            for _ in start.x...end.x {
                let point = Point(x: points.last!.x + 1, y: points.last!.y + 1)
                points.append(point)
                if point == end {
                    break
                }
            }

            return points
        }

        return []
    }

    var is45DegreeAngle: Bool {
        let angle = start.angle(to: end)
        let validAngles: [CGFloat] = [45, 135, 225, 315]
        return validAngles.contains(angle)
    }

    var isStraight: Bool {
        return start.y == end.y || start.x == end.x
    }

    private var isHorizontal: Bool {
        return start.y == end.y
    }

    private var isVertical: Bool {
        return start.x == end.x
    }

    private var straightRange: ClosedRange<Int>? {
        guard isStraight else { return nil }

        let (min, max): (Int, Int)
        if isVertical {
             (min, max) = start.y < end.y ? (start.y, end.y) : (end.y, start.y)
        } else {
            (min, max) = start.x < end.x ? (start.x, end.x) : (end.x, start.x)
        }

        return min...max
    }
}

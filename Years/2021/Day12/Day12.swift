//
//  Day12.swift
//  AdventOfCode
//

import Foundation
import AOCCore

final class Day12: Day {
    func part1(_ input: String) -> CustomStringConvertible {
        let lines = input.toLines()

        let map = CaveMap()
        lines.forEach({ map.processConnections(from: $0) })

        return map.numberOfRoutes
    }

    func part2(_ input: String) -> CustomStringConvertible {
        return 0
    }
}

private final class CaveMap {
    private(set) var caves: Set<Cave>
    let start: Cave
    let end: Cave

    init() {
        let start = Cave(label: "start")
        self.start = start
        let end = Cave(label: "end")
        self.end = end
        self.caves = [start, end]
    }

    var numberOfRoutes: Int {
        var count = 0

        for cave in start.connections {
            
        }

        return count
    }

    func processConnections(from string: String) {
        let exploded = string.split(separator: "-").map({ String($0) })
        let lhs = parseCaves(from: exploded[0])
        let rhs = parseCaves(from: exploded[1])
        for leftCave in lhs {
            for rightCave in rhs {
                rightCave.connections.insert(leftCave)
            }
        }
    }

    private func parseCaves(from string: String) -> [Cave] {
        if string == "start" {
            return [start]
        } else if string == "end" {
            return [end]
        }

        return string.map({ label in
            if let cave = self.caves.first(where: { $0.label == String(label) }) {
                return cave
            }

            let cave = Cave(char: label)
            self.caves.insert(cave)
            return cave
        })
    }
}

private final class Cave: Hashable {
    let label: String

    var connections = Set<Cave>()

    init(label: String) {
        self.label = label
    }

    convenience init(char: Character) {
        self.init(label: String(char))
    }

    static func == (lhs: Cave, rhs: Cave) -> Bool {
        lhs.label == rhs.label
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(label)
    }
}

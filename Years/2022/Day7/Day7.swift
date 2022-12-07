//
//  Day7.swift
//  AdventOfCode
//

import Foundation
import AOCCore

// https://adventofcode.com/2022/day/7

final class Day7: Day {
    func part1(_ input: String) -> CustomStringConvertible {
        let (_, directories) = parseToRoot(input)
        return directories
            .map(\.totalSize)
            .filter { $0 <= 100000 }
            .reduce(0, +)
    }

    func part2(_ input: String) -> CustomStringConvertible {
        let fsSize = 70000000
        let neededSpace = 30000000

        let (root, directories) = parseToRoot(input)

        let unused = fsSize - root.totalSize
        let needToDelete = neededSpace - unused

        let dirToDelete = directories
            .filter({ $0.totalSize > needToDelete })
            .sorted(by: { $0.totalSize < $1.totalSize })
            .first!

        return dirToDelete.totalSize
    }

    private func parseToRoot(_ input: String) -> (root: Node, directories: [Node]) {
        let root = Node(label: "/")

        var currentNode = root
        var listing = false
        var directories = [Node]()
        for instruction in input.toLines().dropFirst() {
            guard instruction != "" else { continue }

            if instruction == "$ ls" {
                listing = true
                continue
            }
            else if listing && instruction.starts(with: /\$/) == false {
                let regex = /^(\d+|\w+) ([\w\.]+)$/
                let match = try! regex.firstMatch(in: instruction)!
                let name = String(match.output.2)
                let child = Node(label: name)

                if match.output.1 == "dir" {
                    directories.append(child)
                }
                else {
                    let size = Int(match.output.1)!
                    child.size = size
                }

                currentNode.children.append(child)
                child.parent = currentNode

                continue
            }
            else if instruction == "$ cd .." {
                currentNode = currentNode.parent!
            }
            else if instruction.starts(with: "$ cd") {
                let regex = /\$ cd (\w+)/
                let dirname = try! regex.firstMatch(in: instruction)!.output.1
                let node = currentNode.children.first(where: { $0.label == dirname })!
                currentNode = node
            }

            listing = false
        }

        return (root, directories)
    }
}

private final class Node {
    var label: String
    var size: Int?

    weak var parent: Node?
    var children = [Node]()

    init(label: String) {
        self.label = label
    }

    var totalSize: Int {
        guard children.isEmpty == false else {
            return size!
        }

        return children
            .map(\.totalSize)
            .reduce(0, +)
    }
}

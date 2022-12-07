//
//  Day7.swift
//  AdventOfCode
//

import Foundation
import AOCCore

// https://adventofcode.com/2022/day/7

final class Day7: Day {
    fileprivate typealias FSNode = Node<Item>

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

    private func parseToRoot(_ input: String) -> (root: FSNode, directories: [FSNode]) {
        let root = FSNode(value: .dir("/"))

        var currentNode = root
        var listing = false
        var directories = [FSNode]()
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

                let child: FSNode
                if match.output.1 == "dir" {
                    child = FSNode(value: .dir(name))
                    directories.append(child)
                }
                else {
                    let size = Int(match.output.1)!
                    child = FSNode(value: .file(name, size))
                }

                currentNode.addChild(child)

                continue
            }
            else if instruction == "$ cd .." {
                currentNode = currentNode.parent!
            }
            else if instruction.starts(with: "$ cd") {
                let regex = /\$ cd (\w+)/
                let dirname = try! regex.firstMatch(in: instruction)!.output.1
                let node = currentNode.children.findDirectory(named: dirname)!
                currentNode = node
            }

            listing = false
        }

        return (root, directories)
    }

    fileprivate enum Item {
        case file(String, Int)
        case dir(String)
    }
}

private extension Node where T == Day7.Item {
    var totalSize: Int {
        switch value {
        case .file(_, let size):
            return size
        case .dir:
            return children.map(\.totalSize).reduce(0, +)
        }
    }
}

private extension Array where Element == Day7.FSNode {
    func findDirectory(named dirname: any StringProtocol) -> Element? {
        return first(where: {
            switch $0.value {
            case .dir(let name):
                return name == dirname
            default:
                return false
            }
        })
    }
}

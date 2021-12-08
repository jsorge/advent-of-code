//
//  Day4.swift
//  AdventOfCode
//

import Foundation
import AOCCore
import Algorithms
import Metal

final class Day4: Day {
    func part1(_ input: String) -> CustomStringConvertible {
        var lines = input.toLines()
        let numbersCalled = lines.removeFirst().split(separator: ",").compactMap({ Int($0) })

        var boards = lines.chunks(ofCount: 5).map({ BingoBoard(rows: $0) })

        var winningBoard: BingoBoard?
        for number in numbersCalled {
            guard winningBoard == nil else { break }
            for board in boards.indices {
                guard winningBoard == nil else { break }
                boards[board].callNumber(number)

                if boards[board].hasWinner {
                    winningBoard = boards[board]
                }
            }
        }

        guard let winningBoard = winningBoard else {
            return -1
        }

        return winningBoard.rows.sumOfUncalledNumbers() * winningBoard.lastCalledNumber
    }

    func part2(_ input: String) -> CustomStringConvertible {
        var lines = input.toLines()
        let numbersCalled = lines.removeFirst().split(separator: ",").compactMap({ Int($0) })

        var eligibleBoards = lines.chunks(ofCount: 5).map({ BingoBoard(rows: $0) })
        var eligibleIndexes = eligibleBoards.indices.reduce(into: [Int: Bool]()) { partialResult, index in
            partialResult[index] = false
        }

        var lastBoard: BingoBoard?
        boardHunt: do {
            for number in numbersCalled {
                for boardIndex in eligibleBoards.indices {
                    var board = eligibleBoards[boardIndex]
                    guard board.hasWinner == false else { continue }
                    board.callNumber(number)
                    eligibleBoards[boardIndex] = board

                    if eligibleBoards[boardIndex].hasWinner {
                        let couldBeWinner = eligibleIndexes.falseIndexes.count == 1

                        eligibleIndexes[boardIndex] = true

                        if couldBeWinner && board.hasWinner {
                            lastBoard = board
                            break boardHunt
                        }
                    }
                }
            }
        }

        let winner = lastBoard!
        return winner.rows.sumOfUncalledNumbers() * winner.lastCalledNumber
    }
}

private struct BingoBoard {
    struct Square {
            let value: Int
        var isSelected = false
    }

    let id = UUID()

    private(set) var rows: [[Square]]
    private(set) var lastCalledNumber: Int = -1

    var hasWinner: Bool {
        if let _ = rows.first(where: { $0.isWinner }) {
            return true
        }

        for column in 0..<rows.first!.count {
            if rows.mapColumn(column).isWinner {
                return true
            }
        }

        return false
    }

    init(rows: ArraySlice<String>) {
        self.rows = Array(repeating: [], count: rows.count)
        for (index, row) in rows.enumerated() {
            let squares = row
                .split(separator: " ")
                .map({ Square(value: Int($0)!) })
            self.rows[index] = squares
        }
    }

    mutating func callNumber(_ number: Int) {
        lastCalledNumber = number

        for rowIndex in rows.indices {
            for squareIndex in rows[rowIndex].indices {
                if rows[rowIndex][squareIndex].value == number {
                    rows[rowIndex][squareIndex].isSelected = true
                    return
                }
            }
        }
    }
}

private extension Array where Element == [BingoBoard.Square] {
    func mapColumn(_ column: Int) -> [BingoBoard.Square] {
        return self.reduce(into: [BingoBoard.Square]()) { partialResult, row in
            partialResult.append(row[column])
        }
    }

    func winningColumn() -> Int? {
        for i in 0..<self.first!.count {
            if mapColumn(i).isWinner {
                return i
            }
        }

        return nil
    }

    func sumOfUncalledNumbers() -> Int {
        return self
            .flatMap({ $0 })
            .filter({ $0.isSelected == false })
            .reduce(into: 0) { partialResult, square in
                partialResult += square.value
            }
    }
}

private extension Array where Element == BingoBoard.Square {
    var isWinner: Bool {
        return allSatisfy({ $0.isSelected })
    }
}

private extension Dictionary where Key == Int, Value == Bool {
    var falseIndexes: [Int] {
        return self.filter({ $0.value == false }).map({ $0.key })
    }
}

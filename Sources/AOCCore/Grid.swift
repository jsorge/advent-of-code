import Foundation
import Algorithms

public typealias Grid<Value> = Dictionary<Point, Value>
typealias Line<Value> = [(Point, Value)]

public extension Dictionary where Key == Point {
    init(_ values: [[Value]]) {
        var grid = Grid<Value>()

        for row in values.indices {
            for col in values[row].indices {
                grid[Point(x: col, y: row)] = values[row][col]
            }
        }

        self = grid
    }

    func printed() {
        let numberOfRows = self.reduce(into: Set<Int>(), { partial, box in partial.insert(box.key.y) }).max()! + 1
        let output = self.reduce(into: [[(Point, Value)]].init(repeating: [], count: numberOfRows)) { partialResult, box in
            partialResult[box.key.y].append(box)
        }.reduce(into: "") { output, row in
            for col in row.sorted(by: { $0.0.x < $1.0.x }) {
                output += "\(col.1) |"
            }
            output += "\n"
        }

        print(output)
    }
}

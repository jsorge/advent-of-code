import Foundation
import Algorithms

public typealias Grid<Value> = Dictionary<Point, Value>
typealias Line<Value> = [(Point, Value)]

public extension Dictionary where Key == Point {
    var numberOfBoxes: Int {
        numberOfRows * numberOfColumns
    }

    var numberOfRows: Int {
        self.reduce(into: Set<Int>(), { partial, box in partial.insert(box.key.y) }).max()! + 1
    }

    var numberOfColumns: Int {
        self.filter({ $0.key.x == 0 }).count
    }

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
        let numberOfRows = self.numberOfRows
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

    func neighbors4(for point: Point) -> [Point] {
        let columns = self.numberOfColumns
        let rows = self.numberOfRows

        return point.neighbors4.filter({ $0.x < columns && $0.y < rows })
    }

    func neighbors8(for point: Point) -> [Point] {
        let columns = self.numberOfColumns
        let rows = self.numberOfRows

        return point.neighbors8.filter({ $0 != point && $0.x < columns && $0.y < rows })
    }
}

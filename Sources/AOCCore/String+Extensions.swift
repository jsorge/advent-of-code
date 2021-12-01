import Foundation

public extension String {
    func toIntArray() -> [Int] {
        return self.split(separator: "\n").compactMap({ Int($0) })
    }
}

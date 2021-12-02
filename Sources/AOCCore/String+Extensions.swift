import Foundation

public extension String {
    func toIntArray() -> [Int] {
        return self.toLines().compactMap({ Int($0) })
    }

    func toLines() -> [String] {
        return self.split(separator: "\n").map({ String($0) })
    }
}

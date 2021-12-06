import Foundation

public extension String {
    func toIntArray(radix: Int = 10) -> [Int] {
        return self.toLines().compactMap({ Int($0, radix: radix) })
    }

    func toLines() -> [String] {
        return self.split(separator: "\n").map({ String($0) })
    }
}

import Foundation

public extension String {
    func toIntArray(radix: Int = 10) -> [Int] {
        return self.toLines().compactMap({ Int($0, radix: radix) })
    }

    func toIntArrayFromLine1(separator: Character = ",", radix: Int = 10) -> [Int] {
        return self.toLines()[0].split(separator: separator).compactMap({ Int(substring: $0) })
    }

    func toLines() -> [String] {
        split(separator: "\n", omittingEmptySubsequences: false)
            .map { String($0) }
    }
}

import Foundation

public extension String {
    func toIntArray(radix: Int = 10) -> [Int] {
        return self.toLines().compactMap({ Int($0, radix: radix) })
    }

    func toIntArrayFromLine1(separator: Character = ",", radix: Int = 10) -> [Int] {
        return self.toLines()[0].split(separator: separator).compactMap({ Int(substring: $0) })
    }

    func toLines() -> [String] {
        let token = "**{emptyline}**"
        let output = self
            .replacingOccurrences(of: "\n\n", with: "\n\(token)\n")
            .split(separator: "\n").map({ String($0) })
            .map { $0.replacingOccurrences(of: token, with: "") }

        return output
    }
}

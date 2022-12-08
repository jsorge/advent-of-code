import Foundation

public extension String {
    func toIntArray(radix: Int = 10) -> [Int] {
        return self.toLines().compactMap({ Int($0, radix: radix) })
    }

    func toIntArrayFromLine1(separator: Character = ",", radix: Int = 10) -> [Int] {
        return self.toLines()[0].split(separator: separator).compactMap({ Int(substring: $0) })
    }

    func toLines(omittingEmpties: Bool = false) -> [String] {
        split(separator: "\n", omittingEmptySubsequences: omittingEmpties)
            .map { String($0) }
    }

    func toIntGrid() -> Grid<Int> {
        let lines = toLines(omittingEmpties: true)
            .compactMap({ $0.compactMap({ Int(character: $0) }) })
        return Grid(lines)
    }
}

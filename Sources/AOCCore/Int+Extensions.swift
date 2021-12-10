import Foundation

public extension Int {
    init?(character: Character) {
        guard let int = Self.init(String(character)) else { return nil }
        self = int
    }

    init?(substring: String.SubSequence) {
        guard let int = Self.init(String(substring)) else { return nil }
        self = int
    }
}

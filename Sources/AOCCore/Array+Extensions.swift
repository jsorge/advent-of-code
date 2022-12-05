import Foundation

public extension Array {
    subscript(safe index: Index) -> Element? {
        if index < count {
            return self[index]
        }

        return nil
    }
}

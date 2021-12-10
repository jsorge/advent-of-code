import Foundation

extension NSRegularExpression {
    public convenience init(_ pattern: String) {
        do {
            try self.init(pattern: pattern)
        } catch {
            preconditionFailure("Illegal regular expression: \(pattern)")
        }
    }

    public func matches(_ string: String) -> Bool {
        let range = NSRange(location: 0, length: string.utf16.count)
        return firstMatch(in: string, options: [], range: range) != nil
    }

    public func allMatches(in string: String) -> [String] {
        let range = NSRange(location: 0, length: string.utf16.count)
        var groups = [String]()
        enumerateMatches(in: string, options: [], range: range) { result, flags, stop in
            guard let numberOfRanges = result?.numberOfRanges else { return }
            for rangeIndex in 0..<numberOfRanges {
                guard let matchRange = result?.range(at: rangeIndex) else { continue }
                let substring = (string as NSString).substring(with: matchRange)
                groups.append(substring)
            }
        }

        return groups
    }
}

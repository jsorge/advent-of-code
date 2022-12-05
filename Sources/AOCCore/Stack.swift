import Foundation

public struct Stack<Element> {
    private var _contents: [Element]

    public var count: Int {
        _contents.count
    }

    public var peek: Element? {
        _contents.last
    }

    public init(_ contents: [Element] = []) {
        _contents = contents
    }

    public mutating func push(_ element: Element) {
        _contents.append(element)
    }

    public mutating func push(contentsOf elements: [Element]) {
        _contents.append(contentsOf: elements)
    }

    public mutating func pop() -> Element? {
        if let last = _contents.last {
            _ = _contents.removeLast()
            return last
        }

        return nil
    }

    public mutating func pop(_ qty: Int) -> [Element] {
        let rangeStart = ((_contents.count - 1) - (qty - 1))
        let rangeEnd = _contents.count - 1

        guard rangeStart <= rangeEnd else { return [] }

        let range = rangeStart ... rangeEnd
        let output = _contents[range]
        _contents.removeLast(qty)
        return Array(output)
    }
}

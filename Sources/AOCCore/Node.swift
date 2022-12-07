import Foundation

public final class Node<T> {
    public private(set) var value: T

    public private(set) weak var parent: Node<T>?
    public private(set) var children = [Node<T>]()

    public init(value: T) {
        self.value = value
    }

    public func addChild(_ child: Node<T>) {
        children.append(child)
        child.parent = self
    }
}

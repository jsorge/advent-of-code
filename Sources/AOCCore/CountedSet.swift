import Foundation

public typealias CountedSet<K: Hashable> = Dictionary<K, Int>

public extension Dictionary where Value == Int {
    func count(forKey key: Key) -> Int {
        return self[key, default: 0]
    }

    
}

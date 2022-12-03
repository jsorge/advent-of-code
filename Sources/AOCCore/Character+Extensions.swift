//
//  File.swift
//  
//
//  Created by Jared Sorge on 12/2/22.
//

import Foundation

public extension Character {
    /// The index position (0-based) of where the alphanumeric character may fall where `a` is 0,
    /// `z` is 26, and `A` is 27.
    var indexValue: Int? {
        lookup[self]
    }

    /// The index position (1-based) of where the alphanumeric character may fall. This is
    /// `indexValue + 1`.
    var ordinalValue: Int? {
        guard let index = indexValue else { return nil }
        return index + 1
    }
}

private let lookup: [Character: Int] = zip("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", (1 ..< 53))
    .reduce(into: [:]) { partial, pair in
        let (letter, value) = pair
        partial[letter] = value
    }


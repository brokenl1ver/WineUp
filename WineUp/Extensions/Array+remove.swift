//
//  Array+remove.swift
//  WineUp
//
//

import Foundation

extension Array where Element: Equatable {
    /// Removed all instances of element in array
    mutating func remove(_ element: Element) {
        removeAll(where: { $0 == element })
    }

    /// Returns a copy of array, removing passed element
    func removing(_ element: Element) -> [Element] {
        var copy = self
        copy.remove(element)
        return copy
    }
}

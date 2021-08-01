//
//  Inversible.swift
//  WineUp
//
//

import Combine

protocol Inversible {
    func inversed() -> Self
}

extension Publisher where Failure == Never, Output: Inversible {
    func toggle() -> Publishers.Map<Self, Output> {
        map {
            $0.inversed()
        }
    }
}

extension Bool: Inversible {
    func inversed() -> Bool {
        !self
    }
}

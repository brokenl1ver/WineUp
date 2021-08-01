//
//  View+onError.swift
//  WineUp
//
//

import SwiftUI

extension View {
    func onError<T>(_ loadable: Loadable<T>, perform block: @escaping () -> Void) -> some View {
        self
            .overlay(
                performView(doPerform: loadable.error != nil, block: block)
            )
    }
}

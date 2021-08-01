//
//  View+hidden.swift
//  WineUp
//
//

import SwiftUI

extension View {
    /// Optionally hides view
    @ViewBuilder
    func hidden(_ hidden: Bool) -> some View {
        if hidden {
            self
                .hidden()
        } else {
            self
        }
    }
}

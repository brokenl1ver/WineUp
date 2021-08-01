//
//  View+shadow.swift
//  WineUp
//
//

import SwiftUI

extension View {
    func faintShadow() -> some View {
        shadow(color: Color.black.opacity(0.1), radius: 32, x: 0, y: 0)
    }
}

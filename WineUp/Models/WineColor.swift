//
//  Common.swift
//  WineUp
//
//

import Foundation

enum WineColor {
    case red, white, rose, orange
}

// MARK: - Helpers

extension WineColor {
    // TODO: Create localize file with localization, can use Rswift for accessing it
    var name: String {
        switch self {
        case .red:
            return "Красное"
        case .white:
            return "Белое"
        case .rose:
            return "Розовое"
        case .orange:
            return "Оранжевое"
        }
    }
}

extension WineJson.Color {
    var wineColor: WineColor {
        switch self {
        case .red:
            return .red
        case .white:
            return .white
        case .rose:
            return .rose
        case .orange:
            return .orange
        }
    }
}

extension WineColor {
    var json: WineJson.Color {
        switch self {
        case .red:
            return .red
        case .white:
            return .white
        case .rose:
            return .rose
        case .orange:
            return .orange
        }
    }
}

//
//  WineSugar.swift
//  WineUp
//
//

import Foundation

enum WineSugar {
    case dry, semiDry, semiSweet, sweet
}

// MARK: - Helpers

extension WineSugar {
    // TODO: Create localize file with localization, can use Rswift for accessing it
    var name: String {
        switch self {
        case .dry:
            return "Сухое"
        case .semiDry:
            return "Полусухое"
        case .semiSweet:
            return "Полусладкое"
        case .sweet:
            return "Сладкое"
        }
    }
}

extension WineJson.Sugar {
    var sugar: WineSugar {
        switch self {
        case .dry:
            return .dry
        case .semiDry:
            return .semiDry
        case .semiSweet:
            return .semiSweet
        case .sweet:
            return .sweet
        }
    }
}

extension WineSugar {
    var json: WineJson.Sugar {
        switch self {
        case .dry:
            return .dry
        case .semiDry:
            return .semiDry
        case .semiSweet:
            return .semiSweet
        case .sweet:
            return .sweet
        }
    }
}

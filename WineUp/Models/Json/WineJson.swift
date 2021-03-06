//
//  WineJson.swift
//  WineUp
//
//

import Foundation

struct WineJson: Decodable {
    var wineId: String
    var avg: Float
    var brandId: String
    var color: Color
    var grapeId: String
    var name: String
    var producerId: String
    var regionId: String
    var sugar: Sugar
    var year: Int
}

extension WineJson {
    enum Color: String, Codable {
        case red = "RED"
        case white = "WHITE"
        case rose = "ROSE"
        case orange = "ORANGE"
    }

    enum Sugar: String, Codable {
        case dry = "DRY"
        case semiDry = "MEDIUM_DRY"
        case semiSweet = "MEDIUM"
        case sweet = "SWEET"
    }

    struct CreateForm: Encodable {
        var avg: Float
        var brandId: String
        var color: Color
        var grapeId: String
        var name: String
        var producerId: String
        var regionId: String
        var sugar: Sugar
        var year: Int
    }

    struct UpdateForm: Encodable {
        var avg: Float
        var brandId: String
        var color: Color
        var grapeId: String
        var name: String
        var producerId: String
        var regionId: String
        var sugar: Sugar
        var year: Int
    }
}

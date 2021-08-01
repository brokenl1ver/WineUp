//
//  TrueWinePositionRecommendationJson.swift
//  WineUp
//
//

import Foundation

struct TrueWinePositionRecommendationJson: Decodable {
    var winePosition: TrueWinePositionJson
    var recommendations: [TrueWinePositionJson]
}

//
//  FavoriteWinePositionJson.swift
//  WineUp
//
//

import Foundation

struct FavoriteWinePositionJson: Decodable {
    /// Id of favorite wine position. The same as `wine_position_id` of wine position in Catalog
    var id: String
}

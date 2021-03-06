//
//  GrapeJson.swift
//  WineUp
//
//

import Foundation

struct GrapeJson: Decodable {
    var id: String
    var name: String
}

extension GrapeJson {
    struct CreateForm: Encodable {
        var name: String
    }

    struct UpdateForm: Encodable {
        var name: String
    }
}

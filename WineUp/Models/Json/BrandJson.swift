//
//  BrandJson.swift
//  WineUp
//
//

import Foundation

struct BrandJson: Decodable {
    var id: String
    var name: String
}

extension BrandJson {
    struct CreateForm: Encodable {
        var name: String
    }
    struct UpdateForm: Encodable {
        var name: String
    }
}

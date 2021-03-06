//
//  MockedData.swift
//  WineUp
//
//

import SwiftUI

#if DEBUG

extension WinePosition {
    static let mockedData: [WinePosition] = [
        .init(title: "Sarget du Gruaud Larose, AOC Saint-Julien", country: "France", color: .red, year: "2014", wineSugar: .dry, quantityLiters: 0.75, isLiked: true, chemistry: 25, titleImageUrl: "assets://testWine 04", retailerName: "Росал", rating: 3, originalPriceRub: 5_999, discountPercents: 0),
        .init(title: "Luce Brunello Di Montalcino", country: "Italia", color: .red, year: "2019", wineSugar: .dry, quantityLiters: 0.75, isLiked: false, chemistry: 15, titleImageUrl: "assets://testWine 02", retailerName: "SimpleWine", rating: 5, originalPriceRub: 14_878, discountPercents: 13),
        .init(title: "Footsteps Reserve Zinfandel", country: "USA", color: .red, year: "2018", wineSugar: .semiDry, quantityLiters: 0.75, isLiked: false, chemistry: 30, titleImageUrl: "assets://testWine 05",retailerName: "Лента", rating: 4, originalPriceRub: 1_799, discountPercents: 5)
    ]
}

extension WinePosition {
    var details: Details {
        .init(
            winePositionId: id,
            suggestions: WinePosition.mockedData
        )
    }
}

extension CatalogFiltersBarView.Item {
    static let mockedData: [CatalogFiltersBarView.Item] = [
        .recomendation,
        .price,
        .country,
        .wineColor,
        .wineSugar
    ]
}

extension PriceFilter.PredefinedPriceInterval {
    static let mockedData: [PriceFilter.PredefinedPriceInterval] = [
        .lessThan(maxPriceRub: 1500),
        .between(minPriceRub: 1500, maxPriceRub: 3000),
        .between(minPriceRub: 3000, maxPriceRub: 5000),
        .between(minPriceRub: 5000, maxPriceRub: 10000),
        .greaterThan(minPriceRub: 10000)
    ]
}

extension StubRadioButtonItem {
    static let mockedData: [StubRadioButtonItem] = [
        .init(text: "First"),
        .init(text: "Second")
    ]
}

extension UserJson {
    static let mockedData: [UserJson] = [
        UserJson(id: "1", birthdate: "12.12.1212", city: .moscow, name: "Alex", phoneNumber: "1234567890", role: "USER"),
        UserJson(id: "2", birthdate: "12.12.1212", city: .saintPetersburg, name: "Vlad", phoneNumber: "1234567890", role: "USER")
    ]
}

#endif

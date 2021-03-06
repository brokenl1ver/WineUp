//
//  WinePositionWebRepositoryBodyBuidler.swift
//  WineUp
//
//

import Foundation

final class WinePositionWebRepositoryQueryParametersBuidler {

    func build(page: Int, amount: Int, filters: [WinePositionFilters], sortBy: FilterSortBy) -> QueryParameters {
        [
            ("page", page.description),
            ("amount", amount.description),
            ("filterBy", buildSearchParameters(for: filters)),
            ("sortByPair", buildSortBy(from: sortBy))
        ]
    }

    // MARK: - Private

    private func buildSearchParameters(for filters: [WinePositionFilters]) -> String {
        return filters.reduce(into: "") { res, filter in
            switch filter {
            case .separator(let sep):
                res += sep.rawValue
            case .value(let value):
                res += value.description
            }
        }
    }

    private func buildSortBy(from sortBy: FilterSortBy) -> String {
        "\(sortBy.attributeName.rawValue)&\(sortBy.order)"
    }
}

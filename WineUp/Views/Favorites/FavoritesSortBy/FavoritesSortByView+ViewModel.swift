//
//  FavoritesSortByView+ViewModel.swift
//  WineUp
//
//

import Foundation

// MARK: - FavoritesSortByView+ViewModel

extension FavoritesSortByView {
    final class ViewModel: ObservableObject {

        @Published var sortByItems: [SortByItem] = []
        @Published var checkedSortByItems: SortByItem?

        init() {
            initStaticSortByItems()
        }

        // MARK: Helpers

        private func initStaticSortByItems() {
            sortByItems = [
                .init(sortBy: .recommended),
                .init(sortBy: .basedOnRating),
                .init(sortBy: .priceAsc),
                .init(sortBy: .priceDesc)
            ]
        }
    }
}

// MARK: - FavoritesSortByView+SortByItem

extension FavoritesSortByView {
    struct SortByItem: Equatable {
        var sortBy: SortBy
    }
}

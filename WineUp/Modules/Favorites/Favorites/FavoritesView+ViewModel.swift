//
//  FavoritesView+ViewModel.swift
//  WineUp
//
//

import UIKit
import Combine

// MARK: - Routing

extension FavoritesView {
    struct Routing: Equatable {
        var winePositionId: String?
    }
}

// MARK: - FavoritesView+ViewModel

extension FavoritesView {
    final class ViewModel: ObservableObject {

        @Published var favoritesItems: Loadable<[WinePosition]> = .notRequested
        @Published var selectedFavoriteItemId: String?
        @Published var searchText: String = ""

        private let container: DIContainer
        private let cancelBag = CancelBag()

        init(container: DIContainer) {
            self.container = container

            cancelBag.collect {
                container.appState.bind(\.routing.favorites.winePositionId, to: self, by: \.selectedFavoriteItemId)
                $selectedFavoriteItemId.bind(to: container.appState, by: \.value.routing.favorites.winePositionId)
                container.services.catalogService.favoritePositionsUpdate.sink(receiveValue: self.updateFavoritePositions)
            }
        }

        // MARK: Public Methods

        func clearFavorites() {
            container.services.catalogService.clearFavorites()
                .sinkToResult {
                    switch $0 {
                    case let .failure(error):
                        print("Error clearing favorites: \(error.description)")
                    case .success:
                        self.loadItems()
                    }
                }
                .store(in: cancelBag)
        }

        func dislike(winePosition: WinePosition) {
            guard var winePositions = favoritesItems.value, winePositions.contains(winePosition) else {
                assertionFailure()
                return
            }
            winePositions.remove(winePosition)

            let bag = CancelBag()
            favoritesItems.setIsLoading(cancelBag: bag)
            container.services.catalogService
                .likeWinePosition(winePositionId: winePosition.id, like: false)
                .map { _ in
                    winePositions
                }
                .sinkToLoadable(of: self, by: \.favoritesItems)
                .store(in: bag)
        }

        func loadItems() {
            container.services.catalogService.load(favoriteWinePositions: loadableSubject(\.favoritesItems))
        }

        var favoritesSortByViewModel: FavoritesSortByView.ViewModel {
            .init()
        }

        func winePositionDetailsViewModelFor(_ winePosition: WinePosition) -> WinePositionDetailsView.ViewModel {
            .init(container: container, winePosition: winePosition)
        }

        // MARK: - Helpers

        private func updateFavoritePositions() {
            loadItems()
        }
    }
}

#if DEBUG
extension FavoritesView.ViewModel {
    static let preview = FavoritesView.ViewModel(container: .preview)
}
#endif

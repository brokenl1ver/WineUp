//
//  CatalogRootViewModel.swift
//  WineUp
//
//

import Foundation

// MARK: - CatalogRootView+ViewModel

extension CatalogRootView {
    final class ViewModel: ObservableObject {

        private let container: DIContainer

        init(container: DIContainer) {
            self.container = container
        }

        // MARK: - Public Methods

        var catalogViewModel: CatalogView.ViewModel {
            .init(container: container)
        }
    }
}

#if DEBUG
extension CatalogRootView.ViewModel {
    static let preview = CatalogRootView.ViewModel(container: .preview)
}
#endif

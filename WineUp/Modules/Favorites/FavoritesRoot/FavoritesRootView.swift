//
//  FavoritesRootView.swift
//  WineUp
//
//

import SwiftUI

// MARK: - View

/// Navigation wrapper of FavoritesView
struct FavoritesRootView: View {

    @ObservedObject private(set) var viewModel: ViewModel

    var body: some View {
        NavigationView {
            FavoritesView(viewModel: viewModel.favoritesViewModel)
        }
    }
}

// MARK: - Preview

#if DEBUG
struct FavoritesRootView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesRootView(viewModel: .preview)
    }
}
#endif

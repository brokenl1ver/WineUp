//
//  RecommendationsRootView.swift
//  WineUp
//
//

import SwiftUI

// MARK: - View

/// Navigation wrapper of FavoritesView
struct RecommendationsRootView: View {

    @ObservedObject private(set) var viewModel: ViewModel

    var body: some View {
        NavigationView {
            RecommendationsView(viewModel: viewModel.recommendationsViewModel)
        }
    }
}

// MARK: - Preview

#if DEBUG
struct RecommendationsRootView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendationsRootView(viewModel: .preview)
    }
}
#endif

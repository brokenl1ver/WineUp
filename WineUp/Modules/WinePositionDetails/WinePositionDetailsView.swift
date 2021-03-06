//
//  WinePositionDetailsView.swift
//  WineUp
//
//

import SwiftUI

// MARK: - View

struct WinePositionDetailsView: View {

    @ObservedObject private(set) var viewModel: ViewModel

    var body: some View {
        ScrollView {
            VStack {
                WinePositionView(item: viewModel.winePosition, onLikeButtonTap: viewModel.toggleLike)
                    .padding()

                Button("В магазин", action: {})
                    .defaultStyled(isDisabled: false)

                if let details = viewModel.details.value {
                    SuggestionsList(
                        title: Text("Мы подобрали для вас\nсхожие вина:"),
                        winePositions: details.suggestions,
                        onLikeButtonTap: viewModel.toggleLike(of:)
                    )
                    .padding(.vertical)
                    .transition(.opacity)
                } else if let error = viewModel.details.error {
                    Text(error.description)
                        .padding()
                        .padding(.vertical, 32)
                } else {
                    Color.clear
                        .frame(height: 300)
                        .activity(triggers: viewModel.details)
                        .onAppear(perform: viewModel.loadDetails)
                }
            }
        }
    }
}

// MARK: - Preview

#if DEBUG
struct WinePositionDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WinePositionDetailsView(viewModel: .preview)
        }
    }
}
#endif

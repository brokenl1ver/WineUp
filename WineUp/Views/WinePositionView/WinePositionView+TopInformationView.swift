//
//  WinePositionView+TopInformationView.swift
//  WineUp
//
//

import SwiftUI

// MARK: - Constants

private extension CGFloat {
    static let itemsSpacing: CGFloat = 80
}

private extension Image {
    static let heartFill = Image(systemName: "suit.heart.fill")
    static let heart = Image(systemName: "suit.heart")
}

private extension LocalizedStringKey {
    static func compatibilityDescription(percentage: Int) -> LocalizedStringKey {
        return "Подходит вам на \(percentage)%"
    }
}

private extension Color {
    static let heartLiked = Color(red: 145 / 255, green: 22 / 255, blue: 52 / 255)
}

private extension Font {
    static let heart: Font = .system(size: 25)
    static let wineDescription: Font = .system(size: 15, weight: .light)
}

// MARK: - View

extension WinePositionView {
    /// Top Information Items
    struct TopInformationView: View {

        let item: WinePosition
        let onLikeButtonTap: () -> Void

        var body: some View {
            HStack(spacing: .itemsSpacing) {
                Text(compatibilityText)
                    .font(.wineDescription)

                Button(action: onLikeButtonTap, label: {
                    heartImage
                        .foregroundColor(Color .heartLiked)
                        .font(.heart)
                })
            }
        }

        // MARK: Helpers

        private var compatibilityText: LocalizedStringKey {
            return .compatibilityDescription(percentage: Int(item.chemistry))
        }
        private var heartImage: Image {
            return item.isLiked ? .heartFill : .heart
        }
    }
}

// MARK: - Preview

#if DEBUG
struct CatalogRowViewTopInformationView_Previews: PreviewProvider {
    private static let item = WinePosition.mockedData[0]

    static var previews: some View {
        WinePositionView.TopInformationView(item: item, onLikeButtonTap: {})
            .previewLayout(.fixed(width: 600, height: 30))
    }
}
#endif

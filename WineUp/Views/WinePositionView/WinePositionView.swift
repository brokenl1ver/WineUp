//
//  WinePositionView.swift
//  WineUp
//
//

import SwiftUI

// MARK: - Constants

private extension CGFloat {
    static let previewWidth: CGFloat = 110
    static let previewHeight: CGFloat = 300
    static let itemsSpacing: CGFloat = 1
    static let CompatibilityOffset: CGFloat = 90
}

// MARK: - View

/// Catalog item visual representation (like `UITableViewCell`)
struct WinePositionView: View {

    let item: WinePosition
    let onLikeButtonTap: () -> Void

    var body: some View {

        VStack(spacing: .itemsSpacing) {
            HStack {
                TopInformationView(item: item, onLikeButtonTap: onLikeButtonTap)
            }
            .padding(.leading, .CompatibilityOffset)

            PreviewImageView(item: item)
                .frame(
                    width: .previewWidth,
                    height: .previewHeight,
                    alignment: .center
                )

            RatingView(item: item)

            InfoView(item: item)
        }
    }
}

// MARK: - Preview

#if DEBUG
struct CatalogRowView_Previews: PreviewProvider {
    static var previews: some View {
        var item = WinePosition.mockedData[1]
        return WinePositionView(item: item, onLikeButtonTap: { item.isLiked.toggle() })
            .previewLayout(.fixed(width: 414, height: 800))
    }
}
#endif

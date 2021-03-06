//
//  WinePositionView+InfoView.swift
//  WineUp
//
//

import SwiftUI

// MARK: - Constants

private extension CGFloat {
    static let shopIconWidth: CGFloat = 23.0
    static let shopIconHeight: CGFloat = 25.0
    static let itemsSpacing: CGFloat = 20.0
}

private extension Image {
    static let shopIcon = Image("iconshop")
}

private extension Font {
    static let itemTitle: Font = .system(size: 25, weight: .black)
    static let wineDescription: Font = .system(size: 18, weight: .light)
}

private extension LocalizedStringKey {
    static let extraParametersText = LocalizedStringKey("Доп. параметры")

    static func wineTitleDescription(title: String, year: String) -> LocalizedStringKey {
        return "\(title) \n\(String(year)) г."
    }

    static func wineShopDescription(description: String) -> LocalizedStringKey {
        return "\(description)"
    }

    static func wineDescriptionFull(color: String, wineSugar: String, country: String, quantity: Float) -> LocalizedStringKey {
        return "\(country), \(String(wineSugar).lowercased()), \(String(color).lowercased()), \(String(format: "%.2f", quantity)) л."
    }
}

// MARK: - View

extension WinePositionView {
    /// Catalog item info, price offer, compatibility and retailer view
    struct InfoView: View {

        let item: WinePosition

        var body: some View {
            VStack(alignment: .center, spacing: .itemsSpacing) {
                Text(itemTittleText)
                    .font(.itemTitle)
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)

                Text(characteristicsTextFull)
                    .font(.wineDescription)

                Text(.extraParametersText)
                    .underline()
                    .font(.wineDescription)

                HStack {
                    WinePositionView.DiscountView(item: item)
                        .horizontallySpanned(alignment: .leading)

                    HStack {
                        Image.shopIcon
                            .resizable()
                            .frame(width: .shopIconWidth, height: .shopIconHeight)

                        Text(retailerText)
                            .font(.wineDescription)
                    }
                }
                .padding(.all)
            }
        }

        // MARK: Helpers

        private var itemTittleText: LocalizedStringKey {
            return .wineTitleDescription(title: item.title, year: item.year)
        }

        private var retailerText: LocalizedStringKey {
            return .wineShopDescription(description: item.retailerName)
        }

        private var characteristicsTextFull: LocalizedStringKey {
            return .wineDescriptionFull(
                color: item.color.name,
                wineSugar: item.wineSugar.name,
                country: item.country,
                quantity: item.quantityLiters
            )
        }
    }
}

// MARK: - Preview

#if DEBUG
struct CatalogRowViewInfoView_Previews: PreviewProvider {
    static var previews: some View {
        WinePositionView.InfoView(item: WinePosition.mockedData[0])
            .previewLayout(.fixed(width: 200, height: 430))
    }
}
#endif

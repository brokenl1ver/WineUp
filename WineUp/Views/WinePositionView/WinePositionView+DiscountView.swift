//
//  WinePositionView+DiscountView.swift
//  WineUp
//
//

import SwiftUI

// MARK: - Constants

private extension CGFloat {
    static let discountOffset: CGFloat = -10.0
}

private extension Font {
    static let priceWithDiscount: Font = .system(size: 24, weight: .medium)
    static let originalPrice: Font = .system(size: 12, weight: .light)
}

// MARK: - View

extension WinePositionView {
    /// Catalog item price offer view
    struct DiscountView: View {

        let item: WinePosition

        var body: some View {
            VStack(alignment: .leading) {
                HStack {
                    if originalPriceRubText != priceWithDiscountText {
                        Text(originalPriceRubText)
                            .font(.originalPrice)
                            .foregroundColor(.gray)
                            .strikethrough()
                            .italic()
                    }
                }
                .padding(.leading, .discountOffset)

                HStack {
                    Text(priceWithDiscountText)
                        .font(.priceWithDiscount)
                        .italic()
                }
            }
        }

        // MARK: Helpers

        private var priceWithDiscountText: String {
            let priceWithDiscount = Int(item.priceWithDiscount)
            return "\(priceWithDiscount)₽"
        }

        private var originalPriceRubText: String {
            let originalPriceRun = Int(item.originalPriceRub)
            return "\(originalPriceRun)₽"
        }
    }
}

// MARK: - Preview Settings

#if DEBUG
struct CatalogRowViewDiscountView_Previews: PreviewProvider {
    static var previews: some View {
        WinePositionView.DiscountView(item: WinePosition.mockedData[1])
            .previewLayout(.fixed(width: 250, height: 150))
    }
}
#endif

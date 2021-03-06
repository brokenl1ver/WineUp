//
//  PriceFilter+MinMaxFields.swift
//  WineUp
//
//

import SwiftUI

// MARK: - Constants

private extension CGFloat {
    static let fieldsHSpacing: CGFloat = 15
    static let fieldsVSpacing: CGFloat = 10
}

private extension Color {
    static let fieldTitle: Color = .gray
}

private extension LocalizedStringKey {
    static let fieldFromTitle = LocalizedStringKey("От")
    static let fieldToTitle = LocalizedStringKey("До")
    static let fieldFromPlaceholder = LocalizedStringKey("0000")
    static let fieldToPlaceholder = LocalizedStringKey("0000")
}

// MARK: - View

extension PriceFilter {
    /// View with fields for manual price interval setting
    struct MinMaxFields: View {

        @Binding var minPriceRub: Int?
        @Binding var maxPriceRub: Int?

        var body: some View {
            HStack(alignment: .center, spacing: .fieldsHSpacing) {
                VStack(alignment: .leading, spacing: .fieldsVSpacing) {
                    Text(LocalizedStringKey.fieldFromTitle)
                        .foregroundColor(.fieldTitle)

                    TextField(LocalizedStringKey.fieldFromPlaceholder, text: minPriceRubText)

                    Divider()
                }

                VStack(alignment: .leading, spacing: .fieldsVSpacing) {
                    Text(LocalizedStringKey.fieldToTitle)
                        .foregroundColor(.fieldTitle)

                    TextField(LocalizedStringKey.fieldToPlaceholder, text: maxPriceRubText)

                    Divider()
                }
            }
        }
    }
}

// MARK: - Helpers

private extension PriceFilter.MinMaxFields {
    /// Bridge between `minPriceRub` and it's text representation
    var minPriceRubText: Binding<String> {
        .init { () -> String in
            minPriceRub.flatMap { "\(Int($0))" } ?? ""
        } set: { text in
            // Limit digits count
            let text = text.prefix(5)
            minPriceRub = text.isEmpty ? nil : Int(text)
        }
    }

    /// Bridge between `maxPriceRub` and it's text representation
    var maxPriceRubText: Binding<String> {
        .init { () -> String in
            maxPriceRub.flatMap { "\(Int($0))" } ?? ""
        } set: { text in
            // Limit digits count
            let text = text.prefix(5)
            maxPriceRub = text.isEmpty ? nil : Int(text)
        }
    }
}

// MARK: - Preview

#if DEBUG
struct PriceFilterMinMaxFields_Previews: PreviewProvider {

    @State private static var minPriceRub: Float?
    @State private static var maxPriceRub: Float?

    static var previews: some View {
        Group {
            PriceFilter.MinMaxFields(minPriceRub: .constant(nil), maxPriceRub: .constant(23))
        }
        .previewLayout(.fixed(width: 390, height: 80))
    }
}
#endif

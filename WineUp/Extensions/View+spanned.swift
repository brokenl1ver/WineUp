//
//  View+spanned.swift
//  WineUp
//
//

import SwiftUI

extension View {
    func horizontallySpanned(minSpace: CGFloat? = nil, alignment: HorizontalAlignment = .center) -> some View {
        HStack {
            if alignment != .leading {
                Spacer(minLength: minSpace)
            }

            self

            if alignment != .trailing {
                Spacer(minLength: minSpace)
            }
        }
    }

    func verticallySpanned(minSpace: CGFloat? = nil, alignment: VerticalAlignment = .center) -> some View {
        VStack {
            if alignment != .top {
                Spacer(minLength: minSpace)
            }

            self

            if alignment != .bottom {
                Spacer(minLength: minSpace)
            }
        }
    }
}

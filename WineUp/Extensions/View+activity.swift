//
//  View+activity.swift
//  WineUp
//
//

import SwiftUI

extension View {

    @ViewBuilder
    func activity(hasActivity: Bool, disableInteractionIfNeeded disableInteraction: Bool = true) -> some View {
        self
            .overlay(
                ActivityIndicator()
                    .scaleEffect()
                    .hidden(!hasActivity)
            )
            .disabled(hasActivity && disableInteraction)
    }

    func activity(triggers: [ActivityTrigger]) -> some View {
        let activityNeeded = triggers.contains(where: { $0.triggersActivity() })
        return self.activity(hasActivity: activityNeeded)
    }

    func activity(triggers: ActivityTrigger...) -> some View {
        activity(triggers: triggers)
    }
}

protocol ActivityTrigger {
    func triggersActivity() -> Bool
}

extension Loadable: ActivityTrigger {
    func triggersActivity() -> Bool {
        if case .isLoading = self {
            return true
        }
        return false
    }
}

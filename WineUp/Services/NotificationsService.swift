//
//  NotificationsService.swift
//  WineUp
//
//

import Combine

public final class NotificationsService: ObservableObject {

    // MARK: - Init

    private init() {}

    // Public
    public static let shared = NotificationsService()

    @Published var wineId: String?
}

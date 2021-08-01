//
//  Services.swift
//  WineUp
//
//

import Foundation

extension DIContainer {
    struct Services {
        let firebaseService: FirebaseService
        let catalogService: CatalogService
        let authenticationService: AuthenticationService
    }
}

// MARK: - Preview

#if DEBUG
extension DIContainer.Services {
    static var preview: Self {
        .init(
            firebaseService: StubFirebaseService.preview,
            catalogService: StubCatalogService.preview,
            authenticationService: StubAuthenticationService.preview
        )
    }
}
#endif

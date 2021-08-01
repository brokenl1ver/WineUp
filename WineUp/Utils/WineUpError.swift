//
//  WineUpError.swift
//  WineUp
//
//

import Foundation

enum WineUpError: Error {
    /// Unexpected WineUp data state
    case invalidAppState(_ description: String?)
    /// Unexpected flow
    case invalidState(_ description: String?)
    /// Method not implemented
    case notImplemented(_ file: String = #file, method: String = #function)
    /// Trying to use method which needs authentication
    case notAuthenticated
    /// User did cancel some flow
    case canceledByUser
}

//
//  Error+description.swift
//  WineUp
//
//

import Foundation

extension Error {
    /// NSError bridging
    var ns: NSError {
        self as NSError
    }

    /// More informative description of error
    var description: String {
        ns.description
    }
}

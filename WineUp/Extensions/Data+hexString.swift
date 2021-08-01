//
//  Data+hexString.swift
//  WineUp
//
//

import Foundation

extension Data {
    var hexString: String {
        map {
            String(format: "%02hhX", $0)
        }
        .joined()
    }
}

//
//  String+onlyDigits.swift
//  WineUp
//
//

import Foundation

extension String {
    var onlyDigits: String {
        filter( "0123456789".contains )
    }
}

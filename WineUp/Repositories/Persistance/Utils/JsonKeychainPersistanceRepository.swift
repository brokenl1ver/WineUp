//
//  JsonKeychainPersistanceRepository.swift
//  WineUp
//
//

import Foundation
import SwiftKeychainWrapper

/// Persistance repository which uses `KeychainWrapper` (secure persistent container) for storing single `Codable` value
class JsonKeychainPersistanceRepository<T: Codable>: KeychainPersistanceRepository {

    let key: String
    let wrapper: KeychainWrapper

    init(key: String, wrapper: KeychainWrapper) {
        self.key = key
        self.wrapper = wrapper
    }

    var value: T? {
        get {
            getValue()
        }
        set {
            set(value: newValue)
        }
    }

    private func getValue() -> T? {
        do {
            if let data = retrieveData() {
                return try decode(data: data)
            } else {
                return nil
            }
        } catch {
            print("Error extracting value from data: \(error)")
            assertionFailure()
            return nil
        }
    }

    private func set(value: T?) {
        do {
            if let value = value {
                save(data: try encode(value))
            } else {
                save(data: nil)
            }
        } catch {
            print("Error saving data from value: \(error)")
            assertionFailure()
        }
    }

    private func decode(data: Data) throws -> T {
        try JSONDecoder().decode(T.self, from: data)
    }

    private func encode(_ value: T) throws -> Data {
        try JSONEncoder().encode(value)
    }

}

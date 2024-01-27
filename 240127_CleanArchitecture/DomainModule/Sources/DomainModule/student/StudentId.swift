//
//  StudentId.swift
//  CleanArchitectureSample
//

import Foundation

public struct StudentId: Hashable, Codable {
    let value: String

    public init() {
        self.value = UUID().uuidString
    }

    func stringValue() -> String {
        return value
    }
}

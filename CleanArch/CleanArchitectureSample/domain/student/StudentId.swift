//
//  StudentId.swift
//  CleanArchitectureSample
//

import Foundation

struct StudentId: Hashable, Codable {
    let value: String

    init() {
        self.value = UUID().uuidString
    }

    func stringValue() -> String {
        return value
    }
}

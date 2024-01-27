//
//  DomainException.swift
//  CleanArchitectureSample
//

import Foundation

struct DomainException: Error {
    let message: String

    init(_ message: String) {
        self.message = message
    }
}

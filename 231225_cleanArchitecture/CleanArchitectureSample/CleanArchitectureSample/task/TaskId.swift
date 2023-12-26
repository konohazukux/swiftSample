//
//  TaskId.swift
//  CleanArchitectureSample
//

import Foundation

struct TaskId {
    let value: String

    init() {
        self.value = UUID().uuidString
    }
}


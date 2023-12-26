//
//  Task.swift
//  CleanArchitectureSample
//

import Foundation

class Task {
    let taskId: TaskId
    let name: String
    var taskStatus: TaskStatus
    var postponeCount: Int
    var dueDate: Date

    init(name: String, dueDate: Date) {
        self.taskId = TaskId() // Assuming TaskId has an initializer
        self.name = name
        self.dueDate = dueDate
        self.taskStatus = .undone
        self.postponeCount = 0
    }

    // Method to postpone a task
    func postpone() throws {
        try validatePostponeCount()
        self.dueDate = Calendar.current.date(byAdding: .day, value: 1, to: self.dueDate)!
        self.postponeCount += 1
    }

    // Method to mark a task as done
    func done() {
        self.taskStatus = .done
    }

    private let maxPostponeCount = 3

    private func validatePostponeCount() throws {
        if self.postponeCount >= maxPostponeCount {
            throw DomainException(message: "Maximum number of postponements exceeded") // Assuming DomainException takes a message
        }
    }
}


// Example of a DomainException
struct DomainException: Error {
    let message: String
}

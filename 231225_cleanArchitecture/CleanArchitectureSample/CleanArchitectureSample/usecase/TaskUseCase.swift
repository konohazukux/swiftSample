//
//  TaskUseCase.swift
//  CleanArchitectureSample
//

import Foundation

class TaskPostponeUseCase {
    private let taskRepository: TaskRepository

    init(taskRepository: TaskRepository) {
        self.taskRepository = taskRepository
    }

    func postponeTask(taskId: TaskId) throws {
        guard let task = taskRepository.findById(taskId) else {
            // Handle the case where the task is not found, possibly throwing an error
            throw DomainException("Task not found")
        }

        task.postpone()
        taskRepository.save(task)
    }
}

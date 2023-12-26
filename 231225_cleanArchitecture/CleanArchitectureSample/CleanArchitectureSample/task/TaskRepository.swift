//
//  TaskRepository.swift
//  CleanArchitectureSample
//
//  Created by TAKESHI SHIMADA on 2023/12/26.
//

import Foundation

protocol TaskRepository {
    func findById(_ taskId: TaskId) -> Task?
    func save(_ task: Task)
}

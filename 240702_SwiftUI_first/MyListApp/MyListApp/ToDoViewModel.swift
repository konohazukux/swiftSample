//
//  ToDoViewModel.swift
//  MyListApp
//
//  Created by TAKESHI SHIMADA on 2024/07/02.
//

import Foundation

class ToDoViewModel: ObservableObject {
  @Published var toDoItems = [
    ToDoItem(title: "Buy groceries", isCompleted: false),
    ToDoItem(title: "Walk the dog", isCompleted: true),
    ToDoItem(title: "Read a book", isCompleted: false)
  ]
}

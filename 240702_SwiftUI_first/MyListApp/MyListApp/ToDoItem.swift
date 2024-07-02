//
//  ToDoItem.swift
//  MyListApp
//
//  Created by TAKESHI SHIMADA on 2024/07/02.
//

import Foundation

struct ToDoItem: Identifiable {
  let id = UUID()
  let title: String
  let isCompleted: Bool
}

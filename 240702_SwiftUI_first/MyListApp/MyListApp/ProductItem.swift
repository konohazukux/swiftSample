//
//  ToDoItem.swift
//  MyListApp
//
//  Created by TAKESHI SHIMADA on 2024/07/02.
//

import Foundation

struct ProductItem: Identifiable {
  let id = UUID()
  let title: String
  var isCompleted: Bool
  
  mutating func toggleCompletion() {
    isCompleted.toggle()
  }
}


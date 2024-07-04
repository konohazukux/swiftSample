//
//  ToDoItem.swift
//  MyListApp
//
//  Created by TAKESHI SHIMADA on 2024/07/02.
//

import Foundation

struct ProductCategory: Identifiable {
  let id = UUID()
  let title: String
  var isCompleted: Bool
  let items: [ProductItem]
  
  mutating func toggleCompletion() {
    isCompleted.toggle()
  }
}


struct ProductItem: Identifiable {
  var id = UUID()
  let title: String
}



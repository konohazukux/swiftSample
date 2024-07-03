//
//  ToDoViewModel.swift
//  MyListApp
//
//  Created by TAKESHI SHIMADA on 2024/07/02.
//

import Foundation

class ProductViewModel: ObservableObject {
  @Published var productCategories = [
    ProductCategory(title: "Buy groceries", isCompleted: false, items: [ProductItem(title: "a1"), ProductItem(title: "a2")]),
    ProductCategory(title: "Walk the dog", isCompleted: true, items: []),
    ProductCategory(title: "Read a book", isCompleted: false, items: [])
  ]
  
  func toggleCompletion(of category: ProductCategory) {
    if let index = productCategories.firstIndex(where: { $0.id == category.id }) {
      productCategories[index].toggleCompletion()
    }
  }
}

//
//  ToDoViewModel.swift
//  MyListApp
//
//  Created by TAKESHI SHIMADA on 2024/07/02.
//

import Foundation

class ProductItemViewModel: ObservableObject {
  @Published var productItems = [
    ProductItem(title: "Buy groceries", isCompleted: false),
    ProductItem(title: "Walk the dog", isCompleted: true),
    ProductItem(title: "Read a book", isCompleted: false)
  ]
  
  func toggleCompletion(of item: ProductItem) {
    if let index = productItems.firstIndex(where: { $0.id == item.id }) {
      productItems[index].toggleCompletion()
    }
  }
}

//
//  ToDoViewModel.swift
//  MyListApp
//
//  Created by TAKESHI SHIMADA on 2024/07/02.
//

import Foundation

class ProductViewModel: ObservableObject {
  @Published var productCategories: [ProductCategory] = []
  
  func loadData() {
    let _productCategories = [
      ProductCategory(title: "いいねの多い人気アイテム", isCompleted: false, items: [ProductItem(title: "a1"), ProductItem(title: "a2")]),
      ProductCategory(title: "10,000円以下の注目アウター", isCompleted: true, items: []),
      ProductCategory(title: "Read a book", isCompleted: false, items: [])
    ]
    productCategories = _productCategories
  }
  
  func toggleCompletion(of category: ProductCategory) {
    if let index = productCategories.firstIndex(where: { $0.id == category.id }) {
      productCategories[index].toggleCompletion()
    }
  }
}

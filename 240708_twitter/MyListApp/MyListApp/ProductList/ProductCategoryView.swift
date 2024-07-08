//
//  ProductCategoryView.swift
//  MyListApp
//
//  Created by TAKESHI SHIMADA on 2024/07/04.
//

import SwiftUI

struct ProductCategoryView: View {
  @Binding var productCategory: ProductCategory
  @State private var selectedValue: String = "--" // Stateプロパティを追加
  @State private var selectedValue2: String = "--"

  var body: some View {
    VStack {
      HStack {
        Text(productCategory.title)
        Spacer()
        Image(systemName: productCategory.isCompleted ? "checkmark.circle.fill" : "circle")
          .foregroundColor(productCategory.isCompleted ? .green : .gray)
          .onTapGesture { }
      }
      ScrollView(.horizontal, showsIndicators: false) {
        HStack {
          ForEach(productCategory.items) { item in
            NavigationLink(
              destination: ProductDetailView(
                item: item,
                value1: $selectedValue,
                onValueChange: { newValue in
                  self.selectedValue2 = newValue
                }
              )) {
              ProductItemView(item: item)
            }
          }
        }
      }
      Text("Selected Value: \(selectedValue)") // 選択された値を表示
      Text("Selected Value: \(selectedValue2)") // クロージャー
    }
    .padding(.horizontal, 10)
  }
}


#Preview {
  @State var previewCategory = ProductCategory(
    title: "Preview Category",
    isCompleted: false,
    items: [
      ProductItem(title: "Preview Item 1"),
      ProductItem(title: "Preview Item 2")
    ]
  )
  
  return ProductCategoryView(productCategory: $previewCategory)
}

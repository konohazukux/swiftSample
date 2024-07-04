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
            NavigationLink(destination: ProductDetailView(title: item.title, value1: $selectedValue)) {
              ProductItemView(item: item)
            }
          }
        }
      }
      Text("Selected Value: \(selectedValue)") // 選択された値を表示
    }
    .padding(.horizontal, 10)
  }
}


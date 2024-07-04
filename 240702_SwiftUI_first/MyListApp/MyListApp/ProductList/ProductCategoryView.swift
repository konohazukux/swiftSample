//
//  ProductCategoryView.swift
//  MyListApp
//
//  Created by TAKESHI SHIMADA on 2024/07/04.
//

import SwiftUI

struct ProductCategoryView: View {
  @Binding var productCategory: ProductCategory
  
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
            ProductItemView(item: item)
          }
        }
      }
    }
    .padding(.horizontal, 10)
  }
}


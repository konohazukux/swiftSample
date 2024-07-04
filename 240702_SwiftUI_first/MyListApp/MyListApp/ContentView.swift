//
//  ContentView.swift
//  MyListApp
//
//  Created by TAKESHI SHIMADA on 2024/07/02.
//

import SwiftUI

struct ContentView: View {
  @StateObject private var viewModel = ProductViewModel()
  
  var body: some View {
    NavigationView {
      ScrollView(.vertical, showsIndicators: false) {
        VStack {
          Button(action: {
            viewModel.loadData()
          }, label: {
            Text("reload")
          })
          ForEach($viewModel.productCategories) {
            ProductCategoryView(productCategory: $0)
          }
        }
      }
      .listStyle(PlainListStyle()) // Remove default styling
      .navigationTitle("To-Do List")
    }
  }
}


#Preview {
  ContentView()
}

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


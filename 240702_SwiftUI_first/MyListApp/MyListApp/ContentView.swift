//
//  ContentView.swift
//  MyListApp
//
//  Created by TAKESHI SHIMADA on 2024/07/02.
//

import SwiftUI

struct ContentView: View {
  @StateObject private var viewModel = ProductItemViewModel()
  
  var body: some View {
    NavigationView {
      VStack {
        ProductItemsView(productItem: $viewModel.productItems[0])
        ProductItemsView(productItem: $viewModel.productItems[1])
      }
      .listStyle(PlainListStyle()) // Remove default styling
      .navigationTitle("To-Do List")
    }
  }
}


#Preview {
  ContentView()
}

struct ProductItemsView: View {
  @Binding var productItem: ProductItem
  
  var body: some View {
    VStack {
      HStack {
        Text(productItem.title)
        Spacer()
        Image(systemName: productItem.isCompleted ? "checkmark.circle.fill" : "circle")
          .foregroundColor(productItem.isCompleted ? .green : .gray)
          .onTapGesture { }
      }
      ScrollView(.horizontal, showsIndicators: false) {
        HStack {
          ForEach(0..<5) { index in
            RoundedRectangle(cornerRadius: 10)
              .fill(Color.blue)
              .frame(width: 100, height: 100)
              .overlay(
                Text("Item \(index)")
                  .foregroundColor(.white)
              )
              .padding(5)
          }
        }
      }
    }
    .padding(.horizontal, 10)
  }
}

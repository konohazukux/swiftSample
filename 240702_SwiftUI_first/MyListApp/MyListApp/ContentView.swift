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
        ProductItemsView(viewModel: viewModel, itemIndex: 0)
        ProductItemsView(viewModel: viewModel, itemIndex: 1)
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
  @ObservedObject var viewModel: ProductItemViewModel
  var itemIndex: Int
  
  var body: some View {
    VStack {
      HStack {
        Text(viewModel.productItems[itemIndex].title)
        Spacer()
        Image(systemName: viewModel.productItems[itemIndex].isCompleted ? "checkmark.circle.fill" : "circle")
          .foregroundColor(viewModel.productItems[itemIndex].isCompleted ? .green : .gray)
          .onTapGesture {
            viewModel.toggleCompletion(of: viewModel.productItems[itemIndex])
          }
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

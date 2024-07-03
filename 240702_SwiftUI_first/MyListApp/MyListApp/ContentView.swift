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
        
        ProductItemsView()
        ProductItemsView()

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
  var body: some View {
    VStack {
      HStack {
        Text("タイトル") // ここをviweModelから渡したい
        Spacer()
        Image(systemName: "checkmark.circle.fill")
          .foregroundColor(.green)
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

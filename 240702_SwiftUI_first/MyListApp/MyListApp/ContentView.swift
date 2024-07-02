//
//  ContentView.swift
//  MyListApp
//
//  Created by TAKESHI SHIMADA on 2024/07/02.
//

import SwiftUI

struct ContentView: View {
  @StateObject private var viewModel = ToDoViewModel()
  
  var body: some View {
    NavigationView {
      List(viewModel.toDoItems) { item in
        HStack {
          Text(item.title)
          Spacer()
          if item.isCompleted {
            Image(systemName: "checkmark.circle.fill")
              .foregroundColor(.green)
          } else {
            Image(systemName: "circle")
              .foregroundColor(.gray)
          }
        }
      }
      .navigationTitle("To-Do List")
    }
  }
}

#Preview {
  ContentView()
}

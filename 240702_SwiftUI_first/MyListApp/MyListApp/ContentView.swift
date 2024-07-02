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
      List {
        ForEach($viewModel.toDoItems) { $item in
          HStack {
            Text(item.title)
            Spacer()
            Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
              .foregroundColor(item.isCompleted ? .green : .gray)
              .onTapGesture {
                item.toggleCompletion()
              }
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

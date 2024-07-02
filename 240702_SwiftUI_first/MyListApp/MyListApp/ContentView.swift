//
//  ContentView.swift
//  MyListApp
//
//  Created by TAKESHI SHIMADA on 2024/07/02.
//

import SwiftUI

struct ContentView: View {
  let toDoItems = [
    ToDoItem(title: "Buy groceries", isCompleted: false),
    ToDoItem(title: "Walk the dog", isCompleted: true),
    ToDoItem(title: "Read a book", isCompleted: false)
  ]
  
  var body: some View {
    NavigationView {
      List(toDoItems) { item in
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

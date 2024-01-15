//
//  ContentView.swift
//  DropDelegate
//
//  Created by TAKESHI SHIMADA on 2024/01/15.
//

import SwiftUI

struct ContentView: View {
  
  let items = 1...1000
  let columns = [
    GridItem(.adaptive(minimum: 100))
  ]
  
    var body: some View {
      ScrollView {
        LazyVGrid(columns: columns, spacing: 20) {
          ForEach(items, id: \.self) { item in
            Text("Item \(item)")
          }
        }
      }
    }
}

#Preview {
    ContentView()
}



//
//  ContentView.swift
//  RMSample
//

import SwiftUI

struct ContentView: View {
  let viewModel = ContentViewModel()
  var body: some View {
    VStack {
      Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
      Text("Hello, world!")
      Button(action: {
        viewModel.updateUser()
      }) {
        Text("Update User")
          .padding()
          .background(Color.blue)
          .foregroundColor(.white)
          .cornerRadius(8)
      }
    }
    .padding()
  }
}

#Preview {
  ContentView()
}

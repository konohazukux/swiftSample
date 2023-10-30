//
//  File.swift
//  
//
//  Created by TAKESHI SHIMADA on 2023/10/30.
//

import SwiftUI

public struct ContentView: View {
  
  public init() {}

    public var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

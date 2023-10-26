//
//  ReducerDivApp.swift
//  ReducerDiv
//

import SwiftUI
import ComposableArchitecture

@main
struct ReducerDivApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView(
        store: Store(
          initialState: ContentFeature.State(),
          reducer: {
            ContentFeature()
          })
      )
    }
  }
}


//
//  App.swift
//  Sample1128
//
//  Created by TAKESHI SHIMADA on 2023/07/27.
//  Copyright © 2023 TAKESHI SHIMADA. All rights reserved.
//

import ComposableArchitecture
import SwiftUI

@main
struct MyApp: App {
  var body: some Scene {
    WindowGroup { }
  }
}

struct Todos: Reducer {
  struct State: Equatable {
  }
  enum Action {
    case incrementButtonTapped
  }
  func reduce(into state: inout State, action: Action) -> Effect<Action> {
    switch action {
    case .incrementButtonTapped:
      return .none
    }
  }
}

struct AppView: View {
  let store: StoreOf<Todos>
  struct ViewState: Equatable {
  }
  var body: some View {
    WithViewStore(self.store, observe: { $0 }) { viewStore in
      Text("aaaa")
        .font(.largeTitle)
        .padding()
        .background(Color.black.opacity(0.1))
        .cornerRadius(10)
    }
  }
}

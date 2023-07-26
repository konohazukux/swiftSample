//
//  CounterFeature.swift
//  Sample1128
//
//  Created by TAKESHI SHIMADA on 2023/07/26.
//  Copyright © 2023 TAKESHI SHIMADA. All rights reserved.
//

import SwiftUI
import ComposableArchitecture

struct ConterFeature: ReducerProtocol {
 
  struct State {
    var count = 0
  }
  enum Action {
    case decrementButtonTapped
    case incrementButtonTapped
  }
  
  func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
    switch action {
    case .decrementButtonTapped:
      state.count -= 1
      return .none
    case .incrementButtonTapped:
      state.count += 1
      return .none
    }
  }
  
}

struct CounterView: View {
  let store: StoreOf<ConterFeature>
  var body: some View {
    VStack {
      Text("0")
        .font(.largeTitle)
        .padding()
        .background(Color.black.opacity(0.1))
        .cornerRadius(10)
      HStack {
        Button("-"){}
          .font(.largeTitle)
          .padding()
          .background(Color.black.opacity(0.1))
          .cornerRadius(10)
        Button("+"){}
          .font(.largeTitle)
          .padding()
          .background(Color.black.opacity(0.1))
          .cornerRadius(10)
      }
    }
  }
}


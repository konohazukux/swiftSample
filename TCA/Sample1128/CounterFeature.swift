//
//  CounterFeature.swift
//  Sample1128
//
//  Created by TAKESHI SHIMADA on 2023/07/26.
//  Copyright © 2023 TAKESHI SHIMADA. All rights reserved.
//

import SwiftUI
import ComposableArchitecture

struct CounterFeature: ReducerProtocol {
 
  struct State {
    var count = 0
    var fact: String?
    var isLoading = false
  }
  enum Action {
    case decrementButtonTapped
    case incrementButtonTapped
    case factButtonTapped
  }
  
  func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
    switch action {
    case .decrementButtonTapped:
      state.count -= 1
      state.fact = nil
      return .none
    case .factButtonTapped:
      state.fact = nil
      state.isLoading = true
      return .run { send in
        // ✅ Do async work in here, and send actions back into the system.
      }
    case .incrementButtonTapped:
      state.count += 1
      state.fact = nil
      return .none
    }
  }
  
}

extension CounterFeature.State: Equatable {}

struct CounterView: View {
  let store: StoreOf<CounterFeature>
  
  var body: some View {
    WithViewStore(self.store, observe: { $0 }) { viewStore in
      VStack {
        Text("\(viewStore.count)")
          .font(.largeTitle)
          .padding()
          .background(Color.black.opacity(0.1))
          .cornerRadius(10)
        HStack {
          Button("-"){
            viewStore.send(.decrementButtonTapped)
          }
            .font(.largeTitle)
            .padding()
            .background(Color.black.opacity(0.1))
            .cornerRadius(10)
          Button("+"){
            viewStore.send(.incrementButtonTapped)
          }
            .font(.largeTitle)
            .padding()
            .background(Color.black.opacity(0.1))
            .cornerRadius(10)
        }
          Button("Fact") {
            viewStore.send(.factButtonTapped)
          }
          .font(.largeTitle)
          .padding()
          .background(Color.black.opacity(0.1))
          .cornerRadius(10)
        
        if viewStore.isLoading {
          ProgressView()
        } else if let fact = viewStore.fact {
          Text(fact)
            .font(.largeTitle)
            .multilineTextAlignment(.center)
            .padding()
        }
      }
    }
  }
}

struct CounterView_Previews: PreviewProvider {
  static var previews: some View {
    CounterView(
      store: Store(initialState: CounterFeature.State()) {
          CounterFeature()
      })
  }
}

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
    var isTimerRunning = false
  }
  enum Action {
    case decrementButtonTapped
    case incrementButtonTapped
    case factResponse(String)
    case factButtonTapped
    case timerTick
    case toggleTimerButtonTapped
  }
  
  enum CancelID { case timer }
  
  func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
    switch action {
    case .decrementButtonTapped:
      state.count -= 1
      state.fact = nil
      return .none
    case .factButtonTapped:
      state.fact = nil
      state.isLoading = true
      return .run { [count = state.count] send in
        let (data, _) = try await URLSession.shared
          .data(from: URL(string: "http://numbersapi.com/\(count)")!)
        let fact = String(decoding: data, as: UTF8.self)
        await send(.factResponse(fact))
      }
    case let .factResponse(fact):
      state.fact = fact
      state.isLoading = false
      return .none
    case .incrementButtonTapped:
      state.count += 1
      state.fact = nil
      return .none
    case .timerTick:
      state.count += 1
      state.fact = nil
      return .none
    case .toggleTimerButtonTapped:
      state.isTimerRunning.toggle()
      if state.isTimerRunning {
        return .run { send in
          while true {
            try await Task.sleep(nanoseconds: 1000)
            await send(.timerTick)
          }
        }
        .cancellable(id: CancelID.timer)
      } else {
        return .cancel(id: CancelID.timer)
      }
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
        Button(viewStore.isTimerRunning ? "Stop timer" : "Start timer") {
          viewStore.send(.toggleTimerButtonTapped)
        }
        .font(.largeTitle)
        .padding()
        .background(Color.black.opacity(0.1))
        .cornerRadius(10)
        
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

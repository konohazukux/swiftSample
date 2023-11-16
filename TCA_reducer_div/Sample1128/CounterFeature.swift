//
//  CounterFeature.swift
//  Sample1128
//

import SwiftUI
import ComposableArchitecture

struct CounterFeature: Reducer {
  
  struct State: Equatable {
    var count = 0
  }
  
  enum Action: Equatable {
    case incrementButtonTapped
  }
  
  var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .incrementButtonTapped:
        state.count += 1
        return .none
      }
    }
  }
}
  

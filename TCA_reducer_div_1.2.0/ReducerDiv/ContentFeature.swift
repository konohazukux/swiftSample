//
//  ContentFeature.swift
//  ReducerDiv
//

import Foundation
import ComposableArchitecture


struct ContentFeature: Reducer {
  struct State: Equatable {
    var tap = TapFeature.State()
  }
  enum Action: Equatable {
    case tap(TapFeature.Action)
  }
  var body: some ReducerOf<Self> {
    Scope(state: \.tap, action: /Action.tap, child: { TapFeature() })
    Reduce { state, action in
      switch action {
      default:
        return .none
      }
    }
  }
}


struct TapFeature: Reducer {
  struct State: Equatable { }
  enum Action: Equatable { }
  var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      default:
        return .none
      }
    }
  }
}




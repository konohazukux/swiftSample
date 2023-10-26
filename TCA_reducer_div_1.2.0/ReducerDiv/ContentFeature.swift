//
//  ContentFeature.swift
//  ReducerDiv
//

import Foundation
import ComposableArchitecture


struct ContentFeature: Reducer {
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




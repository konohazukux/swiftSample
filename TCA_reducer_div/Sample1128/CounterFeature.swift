//
//  CounterFeature.swift
//  Sample1128
//

import SwiftUI
import ComposableArchitecture

@Reducer
struct CounterFeature {
 
  struct State: Equatable {
    var count: Int = 0
    var hoge = IncrementFeature.State()
  }
  
  @CasePathable
  enum Action: Equatable {
    case incrementButtonTapped
    case hoge(IncrementFeature.Action)
  }
 
  var body: some ReducerOf<Self> {
   // reducer
    Reduce { state, action in
      switch action {
      case .incrementButtonTapped:
        return .run { send in
          await send(.hoge(.increment))
        }
      case .hoge(let action):
        switch(action) {
        case .delegate(let action):
          switch action {
          case .syncCount(let count):
            state.count = count
            print("#tag115 \(Date().ISO8601Format()) \(#line) \(type(of: self))  \(#function) : \(self) ")
            return .none
          }
        default:
          return .none
        }
      }
    }
   
    // 外出しした reducer
    Scope(state: \.hoge, action: \.hoge) {
      IncrementFeature()
    }
    
  }
}

@Reducer
struct IncrementFeature {
  struct State: Equatable {
    var count = 0
  }
  
  enum Action: Equatable {
    case increment
    case delegate(Delegate)
    
    enum Delegate: Equatable {
      case syncCount(Int)
    }
  }
  var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .increment:
        print("#tag112 \(Date().ISO8601Format()) \(#line) \(type(of: self))  \(#function) : \(self) ")
        state.count += 1
        let count = state.count
        return .run { send in
          await send(.delegate(.syncCount(count)))
        }
      case .delegate:
        return .none
      }
    }
  }
}


//
//  CounterFeature.swift
//  Sample1128
//

import SwiftUI
import ComposableArchitecture

struct CounterFeature: Reducer {
 
  struct State: Equatable {
    var hoge = IncrementFeature.State()
  }
  
  @CasePathable
  enum Action: Equatable {
    case hoge(IncrementFeature.Action)
  }
  
  enum CancelID { case timer }
 
  var body: some ReducerOf<Self> {
    
    Scope(state: \.hoge, action: \.hoge) {
      IncrementFeature()
    }
    
    Reduce { state, action in
      switch action {
      case .hoge(let action):
        switch(action) {
        case .incrementButtonTapped:
          print("#tag115 \(Date().ISO8601Format()) \(#line) \(type(of: self))  \(#function) : \(self) ")
        }
        return .none
      }
    }
  }
}

struct IncrementFeature: Reducer {
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
        print("#tag112 \(Date().ISO8601Format()) \(#line) \(type(of: self))  \(#function) : \(self) ")
        state.count += 1
        return .none
      }
    }
  }
}


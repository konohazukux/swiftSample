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
//    Reduce { state, action in
//      switch action {
//      case .tap(.buttonTapped):
//        print("111 sdf\(#line) \(type(of: self))  \(#function) : \(self) ")
//        return .none
//      default:
//        return .none
//      }
//    }
  }
}


struct TapFeature: Reducer {
  struct State: Equatable { 
    var num = 0
  }
  enum Action: Equatable {
    case buttonTapped
  }
  var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .buttonTapped:
        print("112 sdf\(#line) \(type(of: self))  \(#function) : \(self) ")
        state.num += 1
        return .none
      }
    }
  }
}




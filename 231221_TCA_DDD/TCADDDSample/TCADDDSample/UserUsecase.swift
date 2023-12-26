//
//  UserUsecase.swift
//

import Foundation
import ComposableArchitecture

@Reducer
struct UserUsecase {
  struct State: Equatable {}
  enum Action: Equatable {
    case fetchUser
  }
 
  var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .fetchUser:
        print("#tag111 \(Date().ISO8601Format()) \(#line) \(type(of: self))  \(#function) : \(self) ")
        return .none
      }
    }
  }
  
}

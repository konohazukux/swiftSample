//
//  UserListReducer.swift
//  TCADDDSample
//

import Foundation
import ComposableArchitecture

@Reducer
struct UserListReducer {
  
  struct State: Equatable {
    var user: [User]
    var usecase: UserUsecase.State
  }
  enum Action: Equatable {
    case onAppear
    case usecase(UserUsecase.Action)
  }
  
  var body: some ReducerOf<Self> {
    Scope(state: \.usecase, action: \.usecase) {
      UserUsecase()
    }
    Reduce { state, action in
      switch action {
      case .onAppear:
        return .run { send in
          await send(.usecase(.fetchUser))
        }
      case .usecase:
        return .none
      }
      
    }
  }
}

struct User: Equatable, Identifiable {
  let id: String
  let name: String
  let age: Int
}

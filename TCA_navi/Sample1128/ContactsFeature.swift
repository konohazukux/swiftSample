//
//  ContactsFeature.swift
//  Sample1128
//
//  Created by TAKESHI SHIMADA on 2023/07/30.
//  Copyright © 2023 TAKESHI SHIMADA. All rights reserved.
//

import Foundation
import ComposableArchitecture

struct Contact: Equatable, Identifiable {
  let id: UUID
  var name: String
}

struct ContactsFeature: ReducerProtocol {
  struct State: Equatable {
    var contacts: IdentifiedArrayOf<Contact> = []
  }
  enum Action: Equatable {
    case addButtonTapped
  }
  func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
    switch action {
    case .addButtonTapped:
      // TODO: Handle action
      return .none
    }
  }
}

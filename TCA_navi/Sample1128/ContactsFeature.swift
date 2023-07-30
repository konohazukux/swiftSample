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

struct ContactsFeature: Reducer {
  struct State: Equatable {
    var contacts: IdentifiedArrayOf<Contact> = []
  }
  enum Action: Equatable {
    case addButtonTapped
  }
  var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
        .addButtonTapped:
        //TODO: handle action
        return .none
      }
    }
  }
  
}


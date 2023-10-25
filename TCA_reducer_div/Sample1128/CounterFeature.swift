//
//  CounterFeature.swift
//  Sample1128
//
//  Created by TAKESHI SHIMADA on 2023/07/26.
//  Copyright © 2023 TAKESHI SHIMADA. All rights reserved.
//

import SwiftUI
import ComposableArchitecture


struct AddToCartState: Equatable {
  var count = 0
}

enum AddToCartAction: Equatable {
  case increaseCounter
  case decreaseCounter
}

struct AddToCartEnvironment {
  // Future Dependencies...
}

let reducer = Reducer<AddToCartState, AddToCartAction, AddToCartEnvironment> { state, action, environment in
  switch action {
  case .increaseCounter:
    state.count += 1
    return Effect.none
  default:
    return Effect.none
  }
}

//
//  CounterFeature.swift
//  Sample1128
//
//  Created by TAKESHI SHIMADA on 2023/07/26.
//  Copyright © 2023 TAKESHI SHIMADA. All rights reserved.
//

import ComposableArchitecture

struct ConterFeature: ReducerProtocol {
 
  struct State {
    var count = 0
  }
  enum Action {
    case decrementButtonTapped
    case incrementButtonTapped
  }
  
}

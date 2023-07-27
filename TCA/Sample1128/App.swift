//
//  App.swift
//  Sample1128
//
//  Created by TAKESHI SHIMADA on 2023/07/27.
//  Copyright © 2023 TAKESHI SHIMADA. All rights reserved.
//

import ComposableArchitecture
import SwiftUI

@main
struct MyApp: App {
  
  static let store = Store(initialState: CounterFeature.State()) {
    CounterFeature()
  }
  
  var body: some Scene {
    WindowGroup {
      CounterView(
        store: MyApp.store)
    }
  }
}

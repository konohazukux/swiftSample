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
  static let store = Store(initialState: ContactsFeature.State()) {
    ContactsFeature()
      ._printChanges()
  }
  
  var body: some Scene {
    WindowGroup {
      ContentView(
        store: MyApp.store)
    }
  }
}

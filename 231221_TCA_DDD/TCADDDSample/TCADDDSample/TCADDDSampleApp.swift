//
//  TCADDDSampleApp.swift
//  TCADDDSample
//
//  Created by takeshishimada on 2023/12/21.
//

import SwiftUI
import ComposableArchitecture

@main
struct TCADDDSampleApp: App {
    var body: some Scene {
        WindowGroup {
          UserListView(
            store: Store(
              initialState: UserListReducer.State(
                user: [],
                usecase: UserUsecase.State()
              ),
              reducer: { UserListReducer() } )
          )
        }
    }
}

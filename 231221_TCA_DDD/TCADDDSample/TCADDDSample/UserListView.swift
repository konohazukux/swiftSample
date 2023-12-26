//
//  ContentView.swift
//  TCADDDSample
//
//  Created by takeshishimada on 2023/12/21.
//

import SwiftUI
import ComposableArchitecture

struct UserListView: View {
  let store: StoreOf<UserListReducer>
  var body: some View {
    WithViewStore(store, observe: {$0}) { viewStore in
      VStack {
        Image(systemName: "globe")
          .imageScale(.large)
          .foregroundStyle(.tint)
        Text("Hello, world!")
      }
      .padding()
      .onAppear {
        store.send(.onAppear)
      }
    }
  }
}

#Preview {
  UserListView(
    store: Store(
      initialState: UserListReducer.State(
        user: [],
        usecase: UserUsecase.State()
      ),
      reducer: { UserListReducer() }
    )
  )
}


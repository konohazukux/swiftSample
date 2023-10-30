//
//  ContentView.swift
//  ReducerDiv
//

import SwiftUI
import ComposableArchitecture

struct ContentView: View {
  let store: StoreOf<ContentFeature>
  var body: some View {
    NavigationStack {
      WithViewStore(self.store, observe: { $0 }) { viewStore in
        VStack {
          Image(systemName: "globe")
            .imageScale(.large)
            .foregroundStyle(.tint)
          Text("Hello, world!")
          TapView(
            store: Store(
              initialState: TapFeature.State(),
              reducer: { TapFeature() }
            )
          )
        }
        .padding()
        .background(.regularMaterial)
      }
    }
    
  }
}

#Preview {
  ContentView(
    store: Store(
      initialState: ContentFeature.State(),
      reducer: {
        ContentFeature()
      })
  )
}



struct TapView: View {
  let store: StoreOf<TapFeature>
  var body: some View {
    WithViewStore(self.store, observe: { $0 }) { viewStore in
      HStack {
        Text("Tapして下さい")
        Button("Tap") {
          viewStore.send(.buttonTapped)
        }
      }
    }
  }
}


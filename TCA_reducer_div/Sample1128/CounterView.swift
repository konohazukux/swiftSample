//
//  CounterView.swift
//  StarwarsDictionary
//

import ComposableArchitecture
import SwiftUI

struct CounterView: View {
  let store: StoreOf<CounterFeature>
  
  var body: some View {
    WithViewStore(self.store, observe: { $0 }) { viewStore in
      VStack {
        Text("\(viewStore.count)")
          .font(.largeTitle)
          .padding()
          .background(Color.black.opacity(0.1))
          .cornerRadius(10)
        HStack {
          Button("+"){
            viewStore.send(.incrementButtonTapped)
          }
            .font(.largeTitle)
            .padding()
            .background(Color.black.opacity(0.1))
            .cornerRadius(10)
        }
      }
    }
  }
}

struct CounterView_Previews: PreviewProvider {
  static var previews: some View {
    CounterView(
      store: Store(initialState: CounterFeature.State()) {
          CounterFeature()
      })
  }
}


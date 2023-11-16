//
//  CounterItemView.swift
//  Sample1128
//
//

import Foundation
import SwiftUI
import ComposableArchitecture

//sdf
struct CounterItemView: View {
  let store: StoreOf<CounterItemFeature>
  
//  typealias Body = <#type#>
  var body: some View {
    WithViewStore(self.store, observe: { $0 }) { viewStore in
      Text("sample text")
    }
  }
  
}
struct CounterItemFeature: Reducer {
  struct State: Equatable {
    var count: Int
    var hoge: Int
  }
 
  enum Action: Equatable {
    case increment
  }
  //sdf
  var body: some ReducerOf<Self> {
    Reduce{ state, action in
      switch (action) {
      case .increment:
        return .none
      }
    }
  }
  
}

struct CounterItemView_Previews: PreviewProvider {
  static var previews: some View {
    CounterItemView(
      store: Store(
        initialState: CounterItemFeature.State(
          count: 0, hoge: 0
        ),
        reducer: {
          CounterItemFeature()
        })
    )
  }
}



//
//import Foundation
//import ComposableArchitecture
//
//sdf
//struct ContactsFeature: Reducer {
//  struct State: Equatable { }
//  enum Action: Equatable { }
//  var body: some ReducerOf<Self> {
//    Reduce { state, action in
//      switch action {
//      default:
//        return .none
//      }
//    }
//  }
//}
//
//// 呼び出し側
//sdf///
//struct ContentView: View {
//  var body: some View {
//    UserListView(
//      store: Store(
//        initialState: UserListFeature.State(/*...*/),
//        reducer: { UserListFeature() }
//      )
//    )
//  }
//}
//
//



//
//struct ContactsView: View {
//  let store: StoreOf<ContactsFeature>
//  
//sdf
//  var body: some View {
//    NavigationStack {
//      WithViewStore(self.store, observe: \.contacts) { viewStore in
//        List {
//          ForEach(viewStore.state) { contact in
//            Text(contact.name)
//          }
//        }
//        .navigationTitle("Contacts")
//        .toolbar {
//          ToolbarItem {
//            Button {
//              viewStore.send(.addButtonTapped)
//            } label: {
//sdf
//              Image(systemName: "plus")
//            }
//          }
//        }
//      }
//    }
//  }
//}


//
//  CounterItemView.swift
//  Sample1128
//
//

import Foundation
import ComposableArchitecture

//sdf
struct CounterItemView: View {
  
  let store: StoreOf<CounterItemFeature>
  
  
  
}
struct CounterItemFeature: Reducer {
  struct State: Equatable {
    var count: Int
  }
 
  enum Action: Equatable {
    case intrement
  }
  //sdf
  var body: some ReducerOf<Self> {
    Reduce{ state, action in
      switch (action) {
      case .intrement:
        return .none
      }
    }
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


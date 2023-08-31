import Foundation
import ComposableArchitecture
import SwiftUI

struct ContactsFeature: Reducer {
  struct State: Equatable {
    let contacts: [Contact]
  }
  enum Action: Equatable {
    case addButtonTapped
  }
  var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .addButtonTapped:
        return .none
      default:
        return .none
      }
    }
  }
}

struct Contact: Equatable, Identifiable {
  let id: UUID
  var name: String
}

struct ContactsView: View {
  let store: StoreOf<ContactsFeature>
  var body: some View {
    NavigationStack {
      WithViewStore(self.store, observe: \.contacts ) { viewStore in
          List {
            ForEach(viewStore.state) { contact in
              Text(contact.name)
            }
          }
        }
    }
  }
}

struct ContactsView_Previews: PreviewProvider {
  static let store = Store(
    initialState: ContactsFeature.State(
      contacts: [
        Contact(id: UUID(), name: "Blob"),
        Contact(id: UUID(), name: "Blob Jr"),
        Contact(id: UUID(), name: "Blob Sr"),
      ]
    ),
    reducer: ContactsFeature()
  )
  static var previews: some View {
    ContactsView(store: store)
  }
}

//struct ContactsView: View {
//  let store: StoreOf<ContactsFeature>
//
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
//              Image(systemName: "plus")
//            }
//          }
//        }
//      }
//    }
//  }
//}

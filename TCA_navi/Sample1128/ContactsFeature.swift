import Foundation
import ComposableArchitecture
import SwiftUI

struct ContactsFeature: Reducer {
  struct State: Equatable {
    @PresentationState var addContact: AddContactFeature.State?
    var contacts: IdentifiedArrayOf<Contact> = []
  }
  enum Action: Equatable {
    case addButtonTapped
    case addContact(PresentationAction<AddContactFeature.Action>)
  }
  var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .addButtonTapped:
        state.addContact = AddContactFeature.State(
          contact: Contact(id: UUID(), name: "")
        )
        return .none
      case let .addContact(.presented(.delegate(.saveContact(contact)))):
        state.contacts.append(contact)
        return .none
      case .addContact:
        return .none
      }
    }
    .ifLet(\.$addContact, action: /Action.addContact){
      AddContactFeature()
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
          .navigationTitle("Contacts")
          .toolbar {
            ToolbarItem {
              Button {
                viewStore.send(.addButtonTapped)
              } label: {
                Image(systemName: "plus")
              }
            }
          }
      
        }
    }
    .sheet(
      store: self.store.scope(
        state: \.$addContact,
        action: { .addContact($0) }
      )
    ) { addContactStore in
      NavigationStack {
        AddContactView(store: addContactStore)
      }
    }
  }
}

struct ContactsView_Previews: PreviewProvider {
  static var previews: some View {
    let store = Store(
      initialState: ContactsFeature.State(
        contacts: [
          Contact(id: UUID(), name: "Blob"),
          Contact(id: UUID(), name: "Blob Jr"),
          Contact(id: UUID(), name: "Blob Sr"),
        ]
      ),
      reducer: ContactsFeature()
    )
    ContactsView(store: store)
  }
}


import Foundation
import ComposableArchitecture
import SwiftUI

struct Contact: Equatable, Identifiable {
  let id: UUID
  var name: String
}

struct ContactsFeature: Reducer {
  struct State: Equatable {
    var contacts: IdentifiedArrayOf<Contact> = []
    @PresentationState var destination: Destination.State?
  }
  enum Action: Equatable {
    case addButtonTapped
    case deleteButtonTapped(id: Contact.ID)
    case destination(PresentationAction<Destination.Action>)
    enum Alert: Equatable {
      case confirmDeletion(id: Contact.ID)
    }
  }
  var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .addButtonTapped:
        state.destination = .addContact(
          AddContactFeature.State(
            contact: Contact(id: UUID(), name: "")
          )
        )
        return .none
      case let .destination(.presented(.addContact(.delegate(.saveContact(contact))))):
        state.contacts.append(contact)
        return .none
      case let .destination(.presented(.alert(.confirmDeletion(id: id)))):
        state.contacts.remove(id: id)
        return .none
      case .destination:
        return .none
      case let .deleteButtonTapped(id: id):
        state.alert = AlertState {
          TextState("Are you sure?")
        } actions: {
          ButtonState(
            role: .destructive,
            action: .confirmDeletion(id: id)) {
            TextState("Delete")
          }
        }
        return .none
      }
    }
    .ifLet(\.$addContact, action: /Action.addContact) {
      AddContactFeature()
    }
    .ifLet(\.$alert, action: /Action.alert)
  }
}

extension ContactsFeature {
  struct Destination: Reducer {
    enum State: Equatable {
      case addContact(AddContactFeature.State)
      case alert(AlertState<ContactsFeature.Action.Alert>)
    }
    enum Action: Equatable {
      case addContact(AddContactFeature.Action)
      case alert(ContactsFeature.Action.Alert)
    }
    var body: some ReducerOf<Self> {
      Scope(state: /State.addContact, action: /Action.addContact) {
        AddContactFeature()
      }
    }
  }
}

struct ContentView: View {
  let store: StoreOf<ContactsFeature>

  var body: some View {
    NavigationStack {
      WithViewStore(self.store, observe: \.contacts) { viewStore in
        List {
          ForEach(viewStore.state) { contact in
            HStack {
                  Text(contact.name)
                  Spacer()
                  Button {
                    viewStore.send(.deleteButtonTapped(id: contact.id))
                  } label: {
                    Image(systemName: "trash")
                      .foregroundColor(.red)
                  }
                }
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
      .alert(
        store: self.store.scope(
          state: \.$alert,
          action: { .alert($0) }
        )
      )
    }
  }
  
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(
      store: Store(
        initialState: ContactsFeature.State(
          contacts: [
            Contact(id: UUID(), name: "Blob"),
            Contact(id: UUID(), name: "Blob Jr"),
            Contact(id: UUID(), name: "Blob Sr"),
          ]
        )
      ) {
        ContactsFeature()
      }
    )
  }
}


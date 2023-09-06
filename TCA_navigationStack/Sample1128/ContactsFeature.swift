import Foundation
import ComposableArchitecture
import SwiftUI

struct ContactsFeature: Reducer {
  struct State: Equatable {
    @PresentationState var addContact: AddContactFeature.State?
    @BindingState var path = NavigationPath()
    var contacts: IdentifiedArrayOf<Contact> = []
    
    enum Route: Equatable, Hashable {
      case contactDetail
    }
  }
  enum Action: BindableAction, Equatable {
    case binding(BindingAction<State>)
    case addButtonTapped
    case addContact(PresentationAction<AddContactFeature.Action>)
    case goToContactDetail
  }
  var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .binding(\.$path):
        if state.path.isEmpty {
          //sdf
        }
        return .none
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
      case .goToContactDetail:
        state.path.append(ContactsFeature.State.Route.contactDetail)
        return .none
      default:
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
    WithViewStore(self.store) { viewStore in
      NavigationStack(path: viewStore.binding(\.$path)) {
        List {
          ForEach(viewStore.state.contacts) { contact in
            Button {
              viewStore.send(.goToContactDetail)
            } label: {
              Text(contact.name)
            }
          }
          }
          .navigationTitle("Contacts")
          .navigationDestination(
            for: ContactsFeature.State.Route.self) { route in
              switch route {
              case .contactDetail:
                Text("Hello World")
              }
              
            }
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


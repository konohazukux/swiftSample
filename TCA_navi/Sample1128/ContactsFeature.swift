//
//  ContactsFeature.swift
//  Sample1128
//
//  Created by TAKESHI SHIMADA on 2023/07/30.
//  Copyright © 2023 TAKESHI SHIMADA. All rights reserved.
//

import Foundation
import ComposableArchitecture
import SwiftUI

struct Contact: Equatable, Identifiable {
  let id: UUID
  var name: String
}

struct ContactsFeature: ReducerProtocol {
  struct State: Equatable {
    @PresentationState var addContact: AddContactFeature.State?
    var contacts: IdentifiedArrayOf<Contact> = []
  }
  enum Action: Equatable {
    case addButtonTapped
  }
  func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
    switch action {
    case .addButtonTapped:
      // TODO: Handle action
      return .none
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

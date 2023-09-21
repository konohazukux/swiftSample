import ComposableArchitecture
import SwiftUI

@main
struct MyApp: App {
  static let store = Store(initialState: ContactsFeature.State(contacts: [])) {
    ContactsFeature()._printChanges()
  }
  
  var body: some Scene {
    WindowGroup {
      ContactsView(store: MyApp.store)
    }
  }
}

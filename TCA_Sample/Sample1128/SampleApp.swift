import ComposableArchitecture
import SwiftUI

@main
struct SampleApp: App {
  var body: some Scene {
    WindowGroup {
      SampleView(store: Store(initialState: SampleFeature.State()) {
        SampleFeature()._printChanges()
      })
    }
  }
}


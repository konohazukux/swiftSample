import ComposableArchitecture
import SwiftUI

struct SampleFeature: Reducer {
  struct State {
  }
  enum Action {
    case incrementButtonTapped
  }
  func reduce(into state: inout State, action: Action) -> Effect<Action> {
    switch action {
    case .incrementButtonTapped:
      return .none
    }
  }
}

struct SampleView: View {
  let store: StoreOf<SampleFeature>
  var body: some View {
    Form {
      NavigationLink("Sample", destination: {})
    }
  }
}

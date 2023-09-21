import Foundation
import SwiftUI
import ComposableArchitecture

struct ContactDetailFeature: Reducer {
  struct State: Equatable { }
  enum Action: Equatable { }
  var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      default:
        return .none
      }
    }
  }
}

struct ContactDetailView: View {
  var body: some View {
    Text("Hello, world!")
  }
}

struct ContactDetailView_Previews: PreviewProvider {
  static var previews: some View {
    ContactDetailView()
  }
}


import ComposableArchitecture
   import SwiftUI

struct Todos: Reducer {
  struct State {
    @BindingState var editMode: EditMode = .inactive
    var count = 0
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

extension Todos.State: Equatable {}

struct AppView: View {
  let store: StoreOf<Todos>
  var body: some View {
    WithViewStore(self.store, observe: { $0 }) { viewStore in
      Text("\(viewStore.count)")
        .font(.largeTitle)
        .padding()
        .background(Color.black.opacity(0.1))
        .cornerRadius(10)
    }
  }
}

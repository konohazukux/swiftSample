import ComposableArchitecture
import SwiftUI

struct TodoListFeature: Reducer {
  struct State {
    var count = 0
  }
  enum Action {
    case incrementButtonTapped
  }
  func reduce(into state: inout State, action: Action) -> Effect<Action> {
    switch action {
    case .incrementButtonTapped:
      state.count += 1
      return .none
    }
  }
}

extension TodoListFeature.State: Equatable {}

struct TodoListView: View {
  let store: StoreOf<TodoListFeature>
  var body: some View {
    WithViewStore(self.store, observe: { $0 }) { viewStore in
      VStack {
        Form {
          Text("\(viewStore.count)")
        }
      }
    }
  }
}

struct TodoListView_Previews: PreviewProvider {
  static var previews: some View {
    TodoListView(
      store: Store(
        initialState: TodoListFeature.State(),
        reducer: { TodoListFeature() }
      )
    )
  }
}

import ComposableArchitecture
import SwiftUI

struct TodoListFeature: Reducer {
  struct State {
    var count = 0
    var todos: [Todo] = []
  }
  struct Todo: Identifiable, Equatable {
    var id: UUID
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
      List {
        ForEach(viewStore.state.todos) { todo in
          Text("aaa \(todo.id)")
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

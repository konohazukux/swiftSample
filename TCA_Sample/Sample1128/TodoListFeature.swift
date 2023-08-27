import ComposableArchitecture
import SwiftUI

struct TodoListFeature: Reducer {
  struct Todo: Identifiable, Equatable {
    var id: UUID
    var title: String
  }
  struct State {
    var todos: [Todo] = []
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

extension TodoListFeature.State: Equatable {}

struct TodoListView: View {
  let store: StoreOf<TodoListFeature>
  var body: some View {
    WithViewStore(self.store, observe: { $0 }) { viewStore in
      List {
        ForEach(viewStore.state.todos) { todo in
          Text("\(todo.title)")
        }
      }
    }
  }
}

struct TodoListView_Previews: PreviewProvider {
  static var previews: some View {
    TodoListView(
      store: Store(
        initialState: TodoListFeature.State(todos: dummyTodos),
        reducer: {
          TodoListFeature()
        }
      )
    )
  }
  static let dummyTodos: [TodoListFeature.Todo] = [
    .init(id: UUID(), title: "Todo 1"),
    .init(id: UUID(), title: "Todo 2"),
    .init(id: UUID(), title: "Todo 3"),
    .init(id: UUID(), title: "Todo 4"),
  ]
}

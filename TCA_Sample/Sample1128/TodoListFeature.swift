import ComposableArchitecture
import SwiftUI

struct TodoListFeature: Reducer {
  struct Todo: Identifiable, Equatable {
    var id: UUID
    var title: String
  }
  struct State {
    var todos: [Todo] = [
      .init(id: UUID(), title: "title 1"),
      .init(id: UUID(), title: "title 2")
    ] // TODO
    var selectedTodo: Todo?
  }
  enum Action {
    case todoSelected(Todo)
  }
  func reduce(into state: inout State, action: Action) -> Effect<Action> {
    switch action {
    case .todoSelected(let todo):
      state.selectedTodo = todo
      return .none
    }
  }
}

extension TodoListFeature.State: Equatable {}

struct TodoListView: View {
  let store: StoreOf<TodoListFeature>
  var body: some View {
    WithViewStore(self.store, observe: { $0 }) { viewStore in
      NavigationStack {
        List {
          ForEach(viewStore.state.todos) { todo in
            NavigationLink(
              "\(todo.title)",
              destination:
                TodoDetailView(
                  store: Store(
                    initialState: TodoDetailFeature.State(todo: todo),
                    reducer: { TodoDetailFeature() }
                  )
                ))
          }
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

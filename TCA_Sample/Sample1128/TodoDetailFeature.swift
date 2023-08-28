import ComposableArchitecture
import SwiftUI

struct TodoDetailFeature: Reducer {
  struct State {
    var todo: TodoListFeature.Todo
  }
  enum Action {
    case titleChanged(String)
  }
  func reduce(into state: inout State, action: Action) -> Effect<Action> {
    switch action {
    case .titleChanged(let newTitle):
      state.todo.title = newTitle
      return .none
    }
  }
}

extension TodoDetailFeature.State: Equatable {}

struct TodoDetailView: View {
  let store: StoreOf<TodoDetailFeature>
  var body: some View {
    WithViewStore(self.store, observe: { $0 }) { viewStore in
      List {
        Text("id: \(viewStore.state.todo.id)")
        TextField("title", text: viewStore.binding(
          get: { $0.todo.title },
          send: TodoDetailFeature.Action.titleChanged
        ) )
      }
    }
  }
}

struct TodoDetailView_Previews: PreviewProvider {
  static var previews: some View {
    TodoDetailView(
      store: Store(
        initialState: TodoDetailFeature.State(todo: dummyTodo),
        reducer: {
          TodoDetailFeature()
        }
      )
    )
  }
  static let dummyTodo: TodoListFeature.Todo = .init(id: UUID(), title: "Todo 1")
}

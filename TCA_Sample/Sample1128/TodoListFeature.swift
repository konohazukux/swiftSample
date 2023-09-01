import ComposableArchitecture
import SwiftUI

struct Todo: Identifiable, Equatable {
  var id: UUID
  var title: String
}

struct TodoListFeature: Reducer {
  struct State: Equatable {
    @PresentationState var todoDetail: TodoDetailFeature.State?
    var todos: [Todo] = []
    var selectedTodo: Todo?
  }
  enum Action {
    case todoSelected(Todo)
    case addButtonTapped
    case addTodo(PresentationAction<TodoDetailFeature.Action>)
  }
  
  var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .todoSelected(let todo):
        state.selectedTodo = todo
        return .none
      case .addButtonTapped:
        state.todoDetail = TodoDetailFeature.State(todo: Todo(id: UUID(), title: ""))
        return .none
      case .addTodo:
        return .none
      }
    }
    .ifLet(\.$todoDetail, action: /Action.addTodo) {
      TodoDetailFeature()
    }
  }
}

struct TodoListView: View {
  let store: StoreOf<TodoListFeature>
  var body: some View {
    WithViewStore(self.store, observe: { $0 }) { viewStore in
      NavigationStack {
        List {
          ForEach(viewStore.state.todos) { todo in
            Text(todo.title)
          }
        }
        .navigationTitle("title")
        .navigationBarItems(
          trailing: Button("add") {
            viewStore.send(.addButtonTapped, animation: .default)
          }
        )
      }
      .sheet(
        store: self.store.scope(
          state: \.$todoDetail,
          action: { .addTodo($0) }
        )
      ) { addTodo in
        NavigationStack {
          TodoDetailView(store: addTodo)
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
  static let dummyTodos: [Todo] = [
    .init(id: UUID(), title: "Todo 1"),
    .init(id: UUID(), title: "Todo 2"),
    .init(id: UUID(), title: "Todo 3"),
    .init(id: UUID(), title: "Todo 4"),
  ]
}

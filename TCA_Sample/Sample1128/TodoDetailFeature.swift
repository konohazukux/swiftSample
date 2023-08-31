import ComposableArchitecture
import SwiftUI

struct TodoDetailFeature: Reducer {
  struct State {
    var todo: TodoListFeature.Todo
  }
  enum Action {
    case titleChanged(String)
    case saveTodo
    case delegate(Delegate)
    enum Delegate: Equatable {
      case saveTodo(TodoListFeature.Todo)
    }
  }

  func reduce(into state: inout State, action: Action) -> Effect<Action> {
    switch action {
    case .titleChanged(let newTitle):
      state.todo.title = newTitle
      return .none
    case .saveTodo:
      return .run { [todo = state.todo] send in
        await send(.delegate(.saveTodo(todo)))
      }
    case .delegate:
      return .none
    }
  }
}


extension TodoDetailFeature.State: Equatable {}

struct TodoDetailView: View {
//  @Environment(\.presentationMode) var presentation
  let store: StoreOf<TodoDetailFeature>
  var body: some View {
    WithViewStore(self.store, observe: { $0 }) { viewStore in
      List {
        Text("id: \(viewStore.state.todo.id)")
        TextField("title", text: viewStore.binding(
          get: { $0.todo.title },
          send: TodoDetailFeature.Action.titleChanged
        ) )
        Button("Dismiss") {
            // 2
            dismiss()
        }
      }
      .navigationBarItems(
        trailing: Button("save") {
          viewStore.send(.saveTodo)
          //presentation.wrappedValue.dismiss()
        }
      )
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

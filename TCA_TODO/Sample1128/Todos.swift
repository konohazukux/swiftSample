import ComposableArchitecture
@preconcurrency import SwiftUI

struct Todos: Reducer {
  struct State {
    @BindingState var count: Int = 0
    var todos: IdentifiedArrayOf<Todo.State> = []
  }

  enum Action: BindableAction {
    case incrementButtonTapped
    case addTodoButtonTapped
    case binding(BindingAction<State>)
    case todo(id: Todo.State.ID, action: Todo.Action)
  }

  @Dependency(\.uuid) var uuid

  var body: some Reducer<State, Action> {
    BindingReducer()
    Reduce { state, action in
      switch action {
      case .incrementButtonTapped:
        return .none
      case .addTodoButtonTapped:
        state.todos.insert(Todo.State(id: self.uuid()), at: 0)
        return .none
      case .todo:
        return .none
      case .binding:
        return .none
      }
    }
    // ここが無いと入力した文字が元に戻ってしまう
    .forEach(\.todos, action: /Action.todo(id:action:)) {
      Todo()
    }
  }

}

struct AppView: View {
  let store: StoreOf<Todos>
  
  struct ViewState: Equatable {
    @BindingViewState var count: Int
    init(store: BindingViewStore<Todos.State>) {
      self._count = store.$count
    }
  }
  
  var body: some View {
    WithViewStore(self.store, observe: { ViewState.init(store: $0) }) { viewStore in
      NavigationStack {
        VStack(alignment: .leading) {
          List {
            ForEachStore(
              self.store.scope(state: \.todos, action: Todos.Action.todo(id:action:))
            ){  //Store<Todo.State, Todo.Action>
              TodoView(store: $0)
            }
          }
        }
        .navigationTitle("Todos")
        .navigationBarItems(
          trailing:
            Button("add") {
              viewStore.send(.addTodoButtonTapped, animation: .default)
          }
        )
      }
    }
  }
}

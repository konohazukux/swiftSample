import ComposableArchitecture
import SwiftUI

struct CounterFeature: Reducer {
  struct State {
    var count = 0
  }
  enum Action {
    case incrementButtonTapped
    case decrementButtonTapped
  }
  func reduce(into state: inout State, action: Action) -> Effect<Action> {
    switch action {
    case .incrementButtonTapped:
      state.count += 1
      return .none
    case .decrementButtonTapped:
      state.count -= 1
      return .none
    }
  }
}

extension CounterFeature.State: Equatable {}

struct CounterView: View {
  let store: StoreOf<CounterFeature>
  var body: some View {
    WithViewStore(self.store, observe: { $0 }) { viewStore in
      VStack {
        Text("\(viewStore.count)")
          .font(.largeTitle)
          .padding()
          .background(Color.black.opacity(0.1))
          .cornerRadius(10)
        HStack {
          Button("-"){
            viewStore.send(.decrementButtonTapped)
          }
          .font(.largeTitle)
          .padding()
          .background(Color.black.opacity(0.1))
          .cornerRadius(10)
          Button("+"){
            viewStore.send(.incrementButtonTapped)
          }
          .font(.largeTitle)
          .padding()
          .background(Color.black.opacity(0.1))
          .cornerRadius(10)
        }
      }
    }
  }
}

struct CounterView_Previews: PreviewProvider {
  static var previews: some View {
    CounterView(
      store: Store(
        initialState: CounterFeature.State(), 
        reducer: { CounterFeature() }
      )
    )
  }
}

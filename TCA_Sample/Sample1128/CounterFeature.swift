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

struct CounterView: View {
  let store: StoreOf<CounterFeature>
  var body: some View {
    VStack {
      Text("0")
        .font(.largeTitle)
        .padding()
        .background(Color.black.opacity(0.1))
        .cornerRadius(10)
      HStack {
        Button("-"){
        }
        .font(.largeTitle)
        .padding()
        .background(Color.black.opacity(0.1))
        .cornerRadius(10)
        Button("+"){
        }
        .font(.largeTitle)
        .padding()
        .background(Color.black.opacity(0.1))
        .cornerRadius(10)
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

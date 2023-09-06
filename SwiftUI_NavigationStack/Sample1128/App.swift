import SwiftUI

@main
struct MyApp: App {
  var body: some Scene {
    WindowGroup {
      MyView()
    }
  }
}

struct MyView: View {
  let fruits = ["Apple", "Grape", "strawberry"]
  var body: some View {
    NavigationStack {
      List(fruits, id: \.self) { fruit in
        NavigationLink(fruit, value: fruit)
      }
      .navigationDestination(for: String.self) { fruit in
        Text(fruit)
      }
      .navigationTitle("FruitesList")
    }
  }
}

struct MyView_Previews: PreviewProvider {
  static var previews: some View {
    MyView()
  }
}


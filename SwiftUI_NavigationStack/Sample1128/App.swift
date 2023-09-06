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
  var body: some View {
    Text("Hello, world!")
  }
}

struct MyView_Previews: PreviewProvider {
  static var previews: some View {
    MyView()
  }
}


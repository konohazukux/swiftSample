import SwiftUI
import Combine

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


struct ContentView: View {
  // User Default  キーが Text  バリューが UserDefault
  @AppStorage("Text") var text = "UserDefault"

    var body: some View {
        VStack {
          TextField("place folder", text: self.$text)
        }
    }
}


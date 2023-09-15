import SwiftUI
import Combine
import Firebase

@main
struct MyApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
  
  init() {
    FirebaseApp.configure()
  }
}


struct ContentView: View {

    var body: some View {
        VStack {
            Text("Hello")
        }
    }
}


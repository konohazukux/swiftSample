import SwiftUI
import Combine

@main
struct MyApp: App {
    var userData = UserData()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userData)
        }
    }
}

class UserData: ObservableObject {
    @Published var username: String = "Guest"
}

struct ContentView: View {
    @EnvironmentObject var userData: UserData

    var body: some View {
        VStack {
          Text("Hello, \(userData.username)!")
          Link("View Our Terms of Service",
               destination: URL(string: "https://www.example.com/TOS.html")!)
          Link("メール送信",
               destination: URL(string: "mailto:test@test.test")!)
          Button("Change Name") {
            userData.username = "John Doe"
            }
        }
    }
}


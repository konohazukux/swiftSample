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
            Button("Change Name") {
                userData.username = "John Doe"
            }
        }
    }
}


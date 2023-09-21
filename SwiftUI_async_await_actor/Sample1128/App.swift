import SwiftUI
import Combine

@main
struct AsyncTestApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView()
    }
  }
}

struct ContentView: View {
    @State var text = "Default"
    var body: some View {
        VStack {
            Text(self.text)
            Button("Wait"){
                self.text = "Waiting"
                Task{
                    self.text = await waitFunc()
                    print("waitFunc後に実行")
                }
                print("waitFuncと並列実行")
            }
        }
    }
    
    func waitFunc() async -> String {
        sleep(5)
        return "Finish"
    }
}


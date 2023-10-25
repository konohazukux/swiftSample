import SwiftUI
import Combine

@main
struct AsyncTestApp: App {
  var body: some Scene {
    WindowGroup {
      ActorView()
    }
  }
}

struct ActorView: View {
        
    var testModel = TestModel()
    @State var text = "0"
    
    var body: some View {
        VStack {
            Text(self.text)
                .padding()
            Button("CountUp"){
                Task {
                    await testModel.countUp()
                    self.text = await String(testModel.count)
                }
            }
        }
    }
}

actor TestModel {
    var count = 0
    
    func countUp(){
        sleep(5) //追加
        count += 1
    }
}

import SwiftUI
import Combine

@main
struct DeepLinkTestTestApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(NotificationModel())
    }
  }
}

struct ContentView: View {
  
  @EnvironmentObject var notificationModel: NotificationModel
  
  @SceneStorage("Genre") var genre: String?
  
  var body: some View {
    VStack {
      Button(action: {
        self.notificationModel.setNotification()
      }, label: {
        Text("SetNotification")
      }).padding()
      
      Button(action: {
        self.notificationModel.removeNotification()
      }, label: {
        Text("RemoveNotification")
      }).padding()
    }
  }
}

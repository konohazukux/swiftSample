import SwiftUI
import Combine

@main
struct NotificationTestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(NotificationModel())
        }
    }
}

struct ContentView: View {
    
    @EnvironmentObject var notificationModel:NotificationModel
    
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

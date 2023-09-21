import SwiftUI
import Combine

@main
struct DeepLinkTestTestApp: App {
  var body: some Scene {
    WindowGroup {
      //ContentView().environmentObject(EnvironmentModel())
      ListView()
    }
  }
}

struct ContentView: View {
 
//  @ObservedObject var obsModel = ObserveModel()
  var obsModel = ObserveModel()
  @EnvironmentObject var envModel: EnvironmentModel
  
  var body: some View {
    VStack {
      Text("obsCount: \(self.obsModel.count)")
        .padding()
      Button(action: {
        self.obsModel.count += 1
      }, label: {
        Text("ObsCount up")
      })
     
      Text("EnvCount: \(self.envModel.count)")
        .padding()
      Button(action: {
        self.envModel.count += 1
      }, label: {
        Text("EnvCount up")
      })
      
    }
  }
}

class ObserveModel: ObservableObject {
  @Published var count = 0
//  var count = 0
}

class EnvironmentModel: ObservableObject {
  @Published var count = 0
//  var count = 0
}


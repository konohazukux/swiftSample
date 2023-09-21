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
  @SceneStorage("Item") var item: String?
  
  var body: some View {
    VStack {
      NavigationView {
        List {
          NavigationLink(
            destination: VegetableView(),
            tag: "vegetable",
            selection: self.$genre,
            label: { Text("vegetable") }
          )
          NavigationLink(
            destination: FruitsView(),
            tag: "fruits",
            selection: self.$genre,
            label: {Text("fruits")})
        }.navigationTitle("Genre")
      }
      Button(action: {
          self.notificationModel.setNotification(genre: self.genre ?? "", item: self.item ?? "")
      }, label: {
          Text("Notification")
      })
    }
    .onOpenURL(perform: { url in
               let comp = URLComponents(url: url, resolvingAgainstBaseURL: true)
               
               self.genre = nil
               self.item = nil
               
               DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                   self.genre = comp?.queryItems?.first?.value
               }
               DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                   self.item = comp?.queryItems?.last?.value
               }
           })
  }
}

struct VegetableView: View {
  
  @SceneStorage("Item") var vegetable: String?
  let vegetableList = ["tomato", "carrots", "onion"]
  
  var body: some View {
    List {
      ForEach(self.vegetableList, id:\.self) { vegetable in
        NavigationLink(
          destination: Text(vegetable),
          tag: vegetable,
          selection: self.$vegetable,
          label: { Text(vegetable )}
        )
      }
    }.navigationTitle("Vegetable")
  }
}

struct FruitsView: View {
    
    @SceneStorage("Item") var fruits:String?
    let fruitsList = ["apple","banana","strawberry"]
    
    var body: some View{
        List{
            ForEach(self.fruitsList ,id:\.self){ fruits in
                NavigationLink(
                    destination: Text(fruits),
                    tag: fruits,
                    selection: self.$fruits,
                    label: {Text(fruits)})
            }
        }.navigationTitle("Fruits")
    }
}

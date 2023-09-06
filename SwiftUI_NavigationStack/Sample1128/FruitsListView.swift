import SwiftUI

struct FruitsListView: View {
    @State var path = [String]()
    let fruits = ["Apple" ,"Grape" ,"Strawberry"]
    var body: some View {
        NavigationStack(path: $path){
            List(fruits ,id: \.self){ fruit in
                NavigationLink(fruit ,value: fruit)
            }
            .navigationDestination(for: String.self) { value in
              if fruits.contains(value) {
                VegetablesListView(fruit: value)
              }else{
                Text(value)
              }
            }
            .navigationTitle("FruitsList")
            
            Button("Test"){
                path = ["Apple","Tomato"]
            }
        }
    }
}

struct MyView_Previews: PreviewProvider {
  static var previews: some View {
    FruitsListView()
  }
}


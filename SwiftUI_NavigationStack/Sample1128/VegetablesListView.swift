import SwiftUI

struct VegetablesListView: View {
    
    let vegetables = ["Tomato" ,"Potato" ,"Carrot"]
    
    let fruit:String
    
    var body: some View{
        List(vegetables ,id: \.self){ vegetable in
            NavigationLink(vegetable ,value: vegetable)
        }
        .navigationTitle("VegetablesListView")
        
        Text("selected \(fruit)")
    }
}

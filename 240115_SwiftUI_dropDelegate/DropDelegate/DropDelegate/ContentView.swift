//
//  ContentView.swift
//  DropDelegate
//

import SwiftUI
import UniformTypeIdentifiers

struct ContentView: View {
  
  @State var items = Array(1...1000)
  @State var draggedItem: Int?
  var columns = [
    GridItem(.adaptive(minimum: 100))
  ]
  
    var body: some View {
      ScrollView {
        LazyVGrid(columns: columns, spacing: 20) {
          ForEach(items, id: \.self) { item in
            Text("Item \(item)")
              .padding()
               .frame(height: 100)
               .background(Color.blue)
               .cornerRadius(10)
               .onDrag {
                 self.draggedItem = item
                 return NSItemProvider(object: String(item) as NSString)
               }
               .onDrop(
                of: [String(UTType.plainText.identifier)],
                delegate: DropViewDelegate(
                  item: item,
                  items: $items,
                  draggedItem: $draggedItem
                )
               )
          }
        }
      }
    }
}

struct DropViewDelegate: DropDelegate {
    let item: Int
    @Binding var items: [Int]
    @Binding var draggedItem: Int?
    
    func performDrop(info: DropInfo) -> Bool {
        guard let draggedItem = draggedItem else { return false }
        
        if item != draggedItem {
            let from = items.firstIndex(of: draggedItem)!
            let to = items.firstIndex(of: item)!
            if from != to {
                withAnimation {
                    items.move(fromOffsets: IndexSet(integer: from), toOffset: to > from ? to + 1 : to)
                }
            }
        }
        return true
    }
}

#Preview {
    ContentView()
}



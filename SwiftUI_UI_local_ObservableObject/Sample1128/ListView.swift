//
//  ListView.swift
//  Sample1128
//

import Foundation
import SwiftUI

struct ListView: View {
  @ObservedObject var listModel = ListModel()
  var body: some View {
    VStack {
      List {
        ForEach(self.listModel.listItems){ item in
          ListItemView(listItem: item)
        }
      }
      Button(action: {
        self.listModel.listItems.append(ListItemModel("Amazon"))
      }, label: {
        Text("Add Item")
      })
    }
  }
}

struct ListView_Previews: PreviewProvider {
  static var previews: some View {
    ListView()
  }
}


class ListModel: ObservableObject {
  @Published var listItems = [
   ListItemModel("Google"),
   ListItemModel("Apple"),
   ListItemModel("Facebook"),
  ]
}

class ListItemModel: ObservableObject, Identifiable {
  @Published var grayOut = false
  let id = UUID()
  let text: String
  init(_ text: String) {
    self.text = text
  }
}

struct ListItemView: View {
  @ObservedObject var listItem: ListItemModel
  var body: some View {
    Text(self.listItem.text)
      .foregroundColor(self.listItem.grayOut ? .gray: .black)
      .onTapGesture {
        self.listItem.grayOut.toggle()
      }
  }
}

//
//  ProductDetailView.swift
//  MyListApp
//
//  Created by TAKESHI SHIMADA on 2024/07/04.
//

import SwiftUI

struct ProductDetailView: View {
  
  let title: String
 
  @Binding var value1: String // 1. Binding
  var onValueChange: (String) -> Void
  
  var body: some View {
    VStack {
      Text("Hello, \(title)")
        .padding(.bottom, 20)
      Text("\(value1)")
        .padding(.bottom, 20)
      HStack {
        Button(action: {
          self.value1 = "OK"
          self.onValueChange("OK2")
        }, label: {
          Text("OK")
        })
        .padding(.horizontal, 20)
        Button(action: {
          self.value1 = "NG"
          self.onValueChange("NG2")
        }, label: {
          Text("NG")
        })
        .padding(.horizontal, 20)
      }
      Spacer()
    }
  }
}

#Preview {
  ProductDetailView(title: "タイトル", value1: .constant("--"), onValueChange: { _ in })
}

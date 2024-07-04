//
//  ProductDetailView.swift
//  MyListApp
//
//  Created by TAKESHI SHIMADA on 2024/07/04.
//

import SwiftUI

struct ProductDetailView: View {
  
  let title: String
  
  var body: some View {
    Text("Hello, \(title)")
  }
}

#Preview {
  ProductDetailView(title: "タイトル")
}

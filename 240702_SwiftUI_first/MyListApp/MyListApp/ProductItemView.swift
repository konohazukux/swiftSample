//
//  ProductItemView.swift
//  MyListApp
//
//  Created by TAKESHI SHIMADA on 2024/07/04.
//

import Foundation
import SwiftUI

struct ProductItemView: View {
  let item: ProductItem
  
  var body: some View {
    RoundedRectangle(cornerRadius: 10)
      .fill(Color.blue)
      .frame(width: 100, height: 100)
      .overlay(
        Text("\(item.title)")
          .foregroundColor(.white)
      )
      .padding(5)
  }
}

#Preview {
  ProductItemView(item: .init(title: "aaa"))
}

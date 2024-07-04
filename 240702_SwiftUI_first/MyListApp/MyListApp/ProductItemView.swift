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
  let urlStr = "https://images.dog.ceo/breeds/australian-shepherd/forest.jpg"
  
  var body: some View {
    RoundedRectangle(cornerRadius: 10)
      .fill(Color.blue)
      .frame(width: 100, height: 100)
      .overlay(
        VStack {
          AsyncImage(url: URL(string: urlStr)) { phase in
            switch phase {
            case .empty:
              ProgressView()
            case .success(let image):
              image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
            case .failure:
              Image(systemName: "photo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
            @unknown default:
              EmptyView()
            }
          }
          Text("\(item.title)")
            .foregroundColor(.white)
        }
      )
      .clipped()
      .padding(5)
  }
}

#Preview {
  ProductItemView(item: .init(title: "aaa"))
}

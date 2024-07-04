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
    Rectangle()
      .fill(Color.blue)
      .frame(width: 100, height: 100)
      .overlay(
        AsyncImage(url: URL(string: urlStr)) { phase in
          switch phase {
          case .empty:
            ProgressView()
          case .success(let image):
            image
              .resizable()
              .aspectRatio(contentMode: .fill)
          case .failure:
            Image(systemName: "photo")
              .resizable()
              .aspectRatio(contentMode: .fit)
          @unknown default:
            EmptyView()
          }
        }
      )
      .overlay(
        VStack {
          Spacer()
          HStack {
            Text(item.title)
              .font(.system(size: 8))
              .foregroundColor(.white)
              .padding(.horizontal, 5) // 左右のパディングを調整
              .padding(.vertical, 2) // 上下のパディングを小さくする
              .background(Color.gray.opacity(0.7))
              .lineLimit(1) // 一行に制限
              .truncationMode(.tail) // 長すぎる場合は三点リーダーを表示
              .offset(y: 3) // Y方向に10ポイントオフセット
            Spacer()
            Image(systemName: "heart")
              .foregroundColor(.white)
          }
        }
      )
  }
}

#Preview {
  ProductItemView(item: .init(title: "B.C STOCK"))
}

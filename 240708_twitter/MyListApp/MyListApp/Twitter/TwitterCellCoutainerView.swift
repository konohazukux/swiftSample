//
//  TwitterCellCoutainerView.swift
//  MyListApp
//
//  Created by TAKESHI SHIMADA on 2024/07/08.
//

import Foundation
import SwiftUI

struct TwitterCellContainerView: View {
  var body: some View {
    VStack {
      Spacer(minLength: 10)
      HStack {
        VStack {
          Image("icon1")
            .resizable()
            .frame(width: 44, height: 44)
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
            .padding(10)
          Spacer()
        }
        VStack(alignment: .leading) {
          HStack {
            Text("y.imajo")
              .foregroundStyle(.white)
              .bold()
            Image("badge1")
              .resizable()
              .frame(width: 20, height: 20)
            Text("yimajo・13時間")
              .foregroundStyle(.gray)
              .tracking(-0.5)
            Spacer()
            Image(systemName: "ellipsis")
              .foregroundStyle(.gray)
              .padding(.trailing, 10)
          }
          Text("Xcode 16だとこのワークアラウンドすらも通用しない。SwiftUI.Viewを使うモジュールはFirestoreに依存させないようにし、View用のモジュールをスキーマとしたら可能。言い換えるとPreviewでFirestoreをビルドしてしまうだけで失敗する。LLVMError(description:")
            .bold()
            .foregroundStyle(.white)
            .font(.system(size: 14))
            .padding(.trailing, 10)
          Image("Image1")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .padding(.trailing, 10)
            .padding(.bottom, 10)
          HStack {
            IconImage(systemName: "checkmark.message")
            IconImage(systemName: "arrow.2.squarepath", number: "2")
            IconImage(systemName: "heart", number: "28")
            IconImage(systemName: "bookmark", number: "271万")
            IconImage(systemName: "bookmark")
          }
        }
      }
      Spacer(minLength: 10)
      Divider().background(.gray)
    }
    .background(.black)
  }
}

struct IconImage: View {
  let systemName: String
  let number: String?
  
  init(systemName: String, number: String? = nil) {
      self.systemName = systemName
      self.number = number
  }
  
  var body: some View {
    HStack {
      Image(systemName: systemName)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 14, height: 14)
        .foregroundStyle(.gray)
      if let number = number {
        Spacer().frame(width: 1) // スペースを詰めるために追加
        Text(number)
          .foregroundStyle(.gray)
          .font(.system(size: 12))
      }
      Spacer()
    }
  }
}


#Preview {
  TwitterCellContainerView()
}



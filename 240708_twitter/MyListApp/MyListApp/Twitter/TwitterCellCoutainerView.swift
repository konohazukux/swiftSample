//
//  TwitterCellCoutainerView.swift
//  MyListApp
//
//  Created by TAKESHI SHIMADA on 2024/07/08.
//

import Foundation
import SwiftUI

struct TwitterCellContainerView: View {
  @EnvironmentObject var modalState: ModalState
  @Binding var showModal: Bool
  var twitterData: TwitterModel
  
  var body: some View {
    VStack {
      Spacer(minLength: 10)
      HStack {
        VStack {
          Image(twitterData.iconName)
            .resizable()
            .frame(width: 44, height: 44)
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
            .padding(10)
          Spacer()
        }
        VStack(alignment: .leading) {
          HStack {
            Text(twitterData.username)
              .foregroundStyle(.white)
              .bold()
            Image("badge1")
              .resizable()
              .frame(width: 20, height: 20)
            Text("\(twitterData.userHandle)・\(twitterData.timePosted)")
              .font(.system(size: 12))
              .foregroundStyle(.gray)
              .tracking(-0.5)
            Spacer()
            ellipsisView
          }
          Text(twitterData.message)
            .bold()
            .foregroundStyle(.white)
            .font(.system(size: 14))
            .padding(.trailing, 10)
          if let imageName = twitterData.imageName {
            Image(imageName)
              .resizable()
              .aspectRatio(contentMode: .fit)
              .clipShape(RoundedRectangle(cornerRadius: 8))
              .padding(.trailing, 10)
              .padding(.bottom, 10)
          }
          HStack {
            IconImage(systemName: "checkmark.message")
              .onTapGesture {
                showModal = true
              }
            IconImage(systemName: "arrow.2.squarepath", number: "2")
              .onTapGesture {
                modalState.showRepost = true
              }
            IconImage(systemName: "heart", number: twitterData.likeCount)
            IconImage(systemName: "bookmark", number: twitterData.bookmarkCount)
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

extension TwitterCellContainerView {
  @ViewBuilder
  private var ellipsisView: some View {
    Menu {
      Button(action: {}){
        Label("リストへ追加または削除", systemImage: "list.bullet")
      }
      Button(action: {}) {
        Label("ポストを報告", systemImage: "flag")
      }
    } label: {
      Image(systemName: "ellipsis")
        .foregroundStyle(.gray)
        .padding(.trailing, 10)
    }
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
  TwitterCellContainerView(
    showModal: .constant(false),
    twitterData: TwitterModel()
  )
    .environmentObject(ModalState())
}



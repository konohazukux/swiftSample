//
//  TwitterListView.swift
//  MyListApp
//
//  Created by TAKESHI SHIMADA on 2024/07/08.
//

import Foundation
import SwiftUI

class ModalState: ObservableObject {
  @Published var showRepost: Bool = false
  @Published var showModal: Bool = false
}

struct TwitterListView: View {
  @EnvironmentObject var modalState: ModalState
  @State private var showModal = false
  @State private var selectedTwitterData = TwitterModel()
  
  let twitterDataList = TwitterModel.makeData()
  
  var body: some View {
    List {
      ForEach(twitterDataList) { twitterData in
        TwitterCellContainerView(
          showModal: $showModal,
          twitterData: twitterData
        )
        .listRowInsets(EdgeInsets())
      }
    }
    .listStyle(.plain)
    .background(Color.black)
    .sheet(isPresented: $modalState.showRepost) {
      HalfModalView()
        .presentationDetents([.height(200)])
        .padding(10)
    }
    .fullScreenCover(isPresented: $showModal) {
      TwitterModalView(showModal: $showModal, twitterData: TwitterModel())
    }
  }
}

// ハーフモーダルとして表示するビュー
struct HalfModalView: View {
  @EnvironmentObject var modalState: ModalState
  
  var body: some View {
    VStack {
      Spacer(minLength: 10)
      selectedView(title: "リポスト")
      selectedView(title: "引用")
      Spacer(minLength: 20)
      cancelButton
    }
    .background(Color(UIColor.systemBackground))
    .frame(maxWidth: .infinity)
    .background(Color.black.opacity(0.5).edgesIgnoringSafeArea(.all))
  }

  @ViewBuilder
  func selectedView(title: String) -> some View {
    Button(action: {
      modalState.showRepost = false
    }) {
      HStack{
        Label {
          Text(title)
            .fontWeight(.medium)
            .foregroundStyle(.black)
        } icon: {
          Image(systemName: "arrow.2.squarepath")
            .foregroundColor(.gray)
        }
        Spacer()
      }
      .padding(.horizontal, 10)
      .padding(.vertical, 10)
    }
    .frame(maxWidth: .infinity)
  }
  var cancelButton: some View {
    Button("キャンセル") {
      modalState.showRepost = false
    }
    .frame(maxWidth: .infinity)
    .padding()
    .foregroundColor(.black)
    .background(Color(UIColor.systemBackground))
    .cornerRadius(25) // 角を丸くする
    .overlay(
      RoundedRectangle(cornerRadius: 25)
        .stroke(Color.gray, lineWidth: 1) // 枠線を追加
    )
    .padding(.horizontal, 20) // 左右に余白を追加
  }
  
}


#Preview {
  TwitterListView()
}




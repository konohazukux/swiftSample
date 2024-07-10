//
//  TwitterListView.swift
//  MyListApp
//
//  Created by TAKESHI SHIMADA on 2024/07/08.
//

import Foundation
import SwiftUI

class ModalState: ObservableObject {
  @Published var showModal: Bool = false
}

struct TwitterListView: View {
//  @State private var showModal = true  ハーフモーダル表示の状態を管理
  @EnvironmentObject var modalState: ModalState

  var body: some View {
    List {
      TwitterCellContainerView()
        .listRowInsets(EdgeInsets())
      TwitterCellContainerView()
        .listRowInsets(EdgeInsets())
    }
    .listStyle(.plain)
    .background(Color.black)
    .sheet(isPresented: $modalState.showModal) { // showModalがtrueの場合にモーダルを表示
      HalfModalView()
        .presentationDetents([.height(200)])
        .padding(10)
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
      modalState.showModal = false
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
      modalState.showModal = false
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




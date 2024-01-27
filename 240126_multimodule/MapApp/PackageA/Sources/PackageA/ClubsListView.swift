//
//  ClubsListView.swift
//  MultiModule
//

import SwiftUI

public struct ClubsListView: View {
  // サンプルデータとしてのクラブ名リスト
  let clubs = ["Club A", "Club B", "Club C", "Club D"]
  
  public init() {
      // 初期化処理
  }

  public var body: some View {
    NavigationView {
      List(clubs, id: \.self) { club in
        Text(club)
      }
      .navigationTitle("Clubs")
    }
  }
}

// SwiftUIプレビュー
struct ClubsListView_Previews: PreviewProvider {
  static var previews: some View {
    ClubsListView()
  }
}

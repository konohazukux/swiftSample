//
//  TwitterListView.swift
//  MyListApp
//
//  Created by TAKESHI SHIMADA on 2024/07/08.
//

import Foundation
import SwiftUI

struct TwitterListView: View {
  var body: some View {
    List {
      TwitterCellContainerView()
        .listRowInsets(EdgeInsets())
      TwitterCellContainerView()
        .listRowInsets(EdgeInsets())
    }
    .listStyle(.plain)
  }
}

#Preview {
  TwitterListView()
}



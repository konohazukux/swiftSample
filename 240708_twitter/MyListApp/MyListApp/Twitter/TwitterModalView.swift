//
//  TwitterModalView.swift
//  MyListApp
//
//  Created by TAKESHI SHIMADA on 2024/07/10.
//

import Foundation
import SwiftUI

struct TwitterModalView: View {
  @EnvironmentObject var modalState: ModalState
  var body: some View {
    VStack {
      HStack {
        Button(action: {
          modalState.showModal = false
        }, label: {
          Text("キャンセル")
        })
        .padding()
        Spacer()
        Button(action: {
          modalState.showModal = false
        }, label: {
          Text("ポスト")
        })
        .padding()
      }
      TwitterCellContainerView()
      Spacer()
        .frame(maxHeight: .infinity)
    }
    .background(.black)
  }
}

#Preview {
  TwitterModalView()
}



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
  @Binding var showModal: Bool
  
  var body: some View {
    VStack {
      HStack {
        Button(action: {
          showModal = false
        }, label: {
          Text("キャンセル")
        })
        .padding()
        Spacer()
        Button(action: {
          showModal = false
        }, label: {
          Text("ポスト")
        })
        .padding()
      }
      TwitterCellContainerView(showModal: $showModal)
      Spacer()
        .frame(maxHeight: .infinity)
    }
    .background(.black)
  }
}

#Preview {
  TwitterModalView(showModal: .constant(false))
}



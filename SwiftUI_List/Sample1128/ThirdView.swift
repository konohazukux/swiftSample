//
//  ThirdView.swift
//  Sample1128
//
//  Created by TAKESHI SHIMADA on 2023/03/27.
//  Copyright © 2023 TAKESHI SHIMADA. All rights reserved.
//

import SwiftUI

// https://note.com/smtakahashi/n/n819591e5905c
struct ThirdView: View {
    @State private var currentIndex = 0
    @State var examples = ["1", "2", "3"]
    @GestureState private var dragOffset: CGFloat = 0
    
    let itemPadding: CGFloat = 20
    
    var body: some View {
        GeometryReader { bodyView in
            HStack(spacing: itemPadding){
                ForEach(examples.indices, id: \.self) { index in
                        Text(examples[index])
                              .foregroundColor(Color.white)
                              .font(.system(size: 50, weight: .bold))
                              .frame(width: bodyView.size.width * 0.8, height: 300)
                              .background(Color.gray)
                              .padding(.leading, index == 0 ? bodyView.size.width * 0.1 : 0)
                    }
            }
            // ドラッグした分だけoffsetを移動する
            .offset(x: self.dragOffset)
            // currentIndexに応じたoffsetへ移動する
            .offset(x: -CGFloat(self.currentIndex) * (bodyView.size.width * 0.8 + itemPadding))
            .gesture(
                      DragGesture()
                          .updating(self.$dragOffset, body: { (value, state, _) in
                              // 移動幅（width）のみ更新する
                              state = value.translation.width
                          })
                          .onEnded({ value in
                              var newIndex = self.currentIndex
                              // ドラッグ幅からページングを判定
                              // 今回は画面幅x0.3としているが、操作感に応じてカスタマイズする必要がある
                              if abs(value.translation.width) > bodyView.size.width * 0.3 {
                                  newIndex = value.translation.width > 0 ? self.currentIndex - 1 : self.currentIndex + 1
                              }
                              
                              // 最小ページ、最大ページを超えないようチェック
                              if newIndex < 0 {
                                  newIndex = 0
                              } else if newIndex > (self.examples.count - 1) {
                                  newIndex = self.examples.count - 1
                              }
                              
                              self.currentIndex = newIndex
                          })
                  )
                
        
        }
    }
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView()
    }
}

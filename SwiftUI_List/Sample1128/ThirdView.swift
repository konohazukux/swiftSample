//
//  ThirdView.swift
//  Sample1128
//
//  Created by TAKESHI SHIMADA on 2023/03/27.
//  Copyright © 2023 TAKESHI SHIMADA. All rights reserved.
//

import SwiftUI

//https://note.com/smtakahashi/n/n819591e5905c
struct ThirdView: View {
    let examples = ["1", "2", "3"]
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
        }
    }
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView()
    }
}

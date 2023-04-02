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
    var body: some View {
        GeometryReader { bodyView in
                 Text("1")
                     .foregroundColor(Color.white)
                     .font(.system(size: 50, weight: .bold))
                     .frame(width: bodyView.size.width * 0.8, height: 300)
                     .background(Color.gray)
                 
             }
    }
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView()
    }
}

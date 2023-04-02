//
//  ThirdView.swift
//  Sample1128
//
//  Created by TAKESHI SHIMADA on 2023/03/27.
//  Copyright © 2023 TAKESHI SHIMADA. All rights reserved.
//

import SwiftUI

struct ThirdView: View {
    let fruits = ["りんご", "オレンジ", "バナナ"]

//https://www.choge-blog.com/programming/swiftuilist%E3%83%93%E3%83%A5%E3%83%BC%E3%81%AE%E4%BD%BF%E3%81%84%E6%96%B9/
//https://capibara1969.com/2266/
    
    var body: some View {
        List {
            ForEach(1 ..< 11) { index in
                  Text("\(index)行目")
              }
            Spacer(minLength: 200)
        }
    }
    
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView()
    }
}

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
    @State private var index = 0
    
    var body: some View {
        TabView {
            Text("First View")
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("First")
                }
            Text("Second View")
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("Second")
                }
            Text("Eleventh View")
                .tabItem {
                    Image(systemName: "11.circle")
                    Text("Eleventh")
                }
        }
    }
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView()
    }
}


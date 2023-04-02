//
//  ThirdView.swift
//  Sample1128
//
//  Created by TAKESHI SHIMADA on 2023/03/27.
//  Copyright © 2023 TAKESHI SHIMADA. All rights reserved.
//

import SwiftUI

struct ThirdView: View {
    var body: some View {
        VStack {
            Carousel()
            Text("hhh")
            SubBanner()
            Announce()
            Spacer()
        }
    }
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView()
    }
}

struct SubBanner: View {
    var body: some View {
        Image("second")
            .resizable() // 画像をリサイズ可能にする
            .aspectRatio(4/1, contentMode: .fit) // アスペクト比を4:1にする
            .frame(width: UIScreen.main.bounds.width) // 横幅をスクリーンの横幅に合わせる
            .clipped() // はみ出した部分を切り取る
    }
}

struct Carousel: View {
    @State private var index = 0
    var body: some View {
        VStack{
            TabView(selection: $index) {
                ForEach((0..<3), id: \.self) { index in
                    CardView()
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        }
        .frame(height: 200)
    }
}

struct CardView: View{
    var body: some View{
        Rectangle()
            .fill(Color.pink)
            .frame(height: 200)
            .border(Color.black)
            .padding()
    }
}

struct Announce: View {
    var body: some View {
        VStack{
            Text("j")
        }
    }
}


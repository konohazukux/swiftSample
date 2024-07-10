//
//  TwitterData.swift
//  MyListApp
//
//  Created by TAKESHI SHIMADA on 2024/07/10.
//

import Foundation

struct TwitterModel: Identifiable {
  var id = UUID()
  var username: String
  var userHandle: String
  var timePosted: String
  var message: String
  var iconName: String
  var imageName: String?
  var likeCount: String
  var bookmarkCount: String
  
  init(
    id: UUID = UUID(),
    username: String = "",
    userHandle: String = "",
    timePosted: String = "",
    message: String = "",
    iconName: String = "",
    imageName: String? = nil,
    likeCount: String = "",
    bookmarkCount: String = ""
  ) {
    self.id = id
    self.username = username
    self.userHandle = userHandle
    self.timePosted = timePosted
    self.message = message
    self.iconName = iconName
    self.imageName = imageName
    self.likeCount = likeCount
    self.bookmarkCount = bookmarkCount
  }
  
  
  static func makeData() -> [TwitterModel] {
    let twitterDataList = [
      TwitterModel(
        username: "y.imajo",
        userHandle: "@yimajo",
        timePosted: "13時間",
        message: "Xcode 16だとこのワークアラウンドすらも通用しない。SwiftUI.Viewを使うモジュールはFirestoreに依存させないようにし、View用のモジュールをスキーマとしたら可能。言い換えるとPreviewでFirestoreをビルドしてしまうだけで失敗する。LLVMError(description:",
        iconName: "icon1",
        imageName: "Image1",
        likeCount: "28",
        bookmarkCount: "271万"
      ),
      TwitterModel(
        username: "k.tanaka",
        userHandle: "@ktanaka",
        timePosted: "5時間",
        message: "Swiftの新しい機能がすごい！Combineを使ってリアクティブプログラミングを行うことで、コードが非常にシンプルになりました。特に、PublisherとSubscriberの概念が非常にわかりやすく、開発が楽になりました。",
        iconName: "icon2",
        imageName: nil,
        likeCount: "100",
        bookmarkCount: "1.5万"
      ),
      TwitterModel(
        username: "m.suzuki",
        userHandle: "@msuzuki",
        timePosted: "2時間",
        message: "iOS 15の新しいAPIを試してみた。特に興味深かったのは、Swift Concurrencyの機能です。async/awaitを使うことで、非同期コードがこれまで以上に読みやすく、書きやすくなりました。",
        
        iconName: "icon3",
        imageName: nil,
        likeCount: "58",
        bookmarkCount: "32万"
      ),
      TwitterModel(
        username: "a.yamada",
        userHandle: "@ayamada",
        timePosted: "1時間",
        message: "ARKitの新機能が素晴らしい。リアルタイムでの物体認識とトラッキングが向上し、より高度なAR体験が可能になりました。特に、3Dオブジェクトのレンダリングが非常に滑らかで現実感があります。",
        
        iconName: "icon4",
        imageName: nil,
        likeCount: "200",
        bookmarkCount: "100万"
      ),
      TwitterModel(
        username: "t.kobayashi",
        userHandle: "@tkobayashi",
        timePosted: "10分",
        message: "SwiftUIのデザインが楽しい！コードを少し変更するだけで、インターフェースがリアルタイムで更新されるのが素晴らしいです。ホットリロード機能により、開発スピードが格段に上がりました。",
        
        iconName: "icon5",
        imageName: nil,
        likeCount: "75",
        bookmarkCount: "45万"
      )
    ]
    return twitterDataList
  }
  
  
}


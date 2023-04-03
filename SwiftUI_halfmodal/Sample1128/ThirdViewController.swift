//
//  ThirdViewController.swift
//  Sample1128
//
//  Created by TAKESHI SHIMADA on 2023/03/27.
//  Copyright © 2023 TAKESHI SHIMADA. All rights reserved.
//

import SwiftUI

final class ThirdViewController: UIHostingController<ContentView> {
   
    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(rootView: ContentView())
    }
}

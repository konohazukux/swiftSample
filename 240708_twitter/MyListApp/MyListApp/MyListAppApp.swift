//
//  MyListAppApp.swift
//  MyListApp
//
//  Created by TAKESHI SHIMADA on 2024/07/02.
//

import SwiftUI

@main
struct MyListAppApp: App {
  var body: some Scene {
    WindowGroup {
      MainView()
    }
  }
}

struct MainView: View {
  var body: some View {
    TabView {
      SettingsView()
        .tabItem {
          Label("Settings", systemImage: "gear")
        }
      ContentView()
        .tabItem {
          Label("To-Do List", systemImage: "list.bullet")
        }
    }
  }
}

struct SettingsView: View {
    var body: some View {
        Text("Settings")
            .font(.largeTitle)
            .padding()
    }
}

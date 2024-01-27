//
//  CleanArchitectureSampleApp.swift
//  CleanArchitectureSample
//

import SwiftUI
import PresentationModule

@main
struct CleanArchitectureSampleApp: App {
    var body: some Scene {
        WindowGroup {
          ClubsListView()
        }
    }
}

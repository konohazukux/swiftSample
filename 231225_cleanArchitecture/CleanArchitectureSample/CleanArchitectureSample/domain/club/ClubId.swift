//
//  ClubId.swift
//  CleanArchitectureSample
//

import Foundation

struct ClubId: Codable, Equatable {
  private let value: String
  
  init() {
    self.value = UUID().uuidString
  }
  
  func stringValue() -> String {
    return value
  }
}

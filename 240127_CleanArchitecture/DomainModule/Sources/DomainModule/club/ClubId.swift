//
//  ClubId.swift
//  CleanArchitectureSample
//

import Foundation

public struct ClubId: Codable, Equatable, Hashable {
  private let value: String
  
  public init() {
    self.value = UUID().uuidString
  }
  
  func stringValue() -> String {
    return value
  }
}

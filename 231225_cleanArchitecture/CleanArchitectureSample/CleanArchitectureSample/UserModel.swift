//
//  UserModel.swift
//  CleanArchitectureSample
//

import Foundation

struct UserModel {
  let id: String
  private var name: String
  private var age: Int
  
  mutating func changeName(name: String) {
    self.name = name
  }
  
  func update() {
    
  }
  
  
}

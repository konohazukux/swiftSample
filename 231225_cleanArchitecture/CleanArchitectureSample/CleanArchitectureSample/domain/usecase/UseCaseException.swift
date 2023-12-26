//
//  UseCaseException.swift
//  CleanArchitectureSample
//

import Foundation

struct UseCaseException: Error {
  let message: String
  
  init(_ message: String) {
    self.message = message
  }
}

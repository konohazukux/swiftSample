//
//  File.swift
//

import Foundation

struct UserModel: Equatable, Identifiable {
  let id: Int
  let loginID: String
  let memo: String?
  let name: String
  let password: String
  let createdAt: Date
  let updatedAt: Date?
  let deletedAt: Date?
}


//
//  UserStoreModel.swift
//  RMSample
//

import Foundation

struct UserStoreModel: Codable {
  let id: Int
  let loginID: String
  let memo: String?
  let name: String
  let password: String
  let createdAt: Date
  let updatedAt: Date?
  let deletedAt: Date?
}

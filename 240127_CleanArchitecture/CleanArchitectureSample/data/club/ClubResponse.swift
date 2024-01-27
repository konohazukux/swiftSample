//
//  ClubResponse.swift
//  CleanArchitectureSample
//

import Foundation

struct ClubResponse: Codable {
  var clubId: ClubId
  var name: String
  var clubStatus: ClubStatus
  var createdAt: String
  var studentIds: [StudentId]
}


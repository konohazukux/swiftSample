//
//  ClubViewModel.swift
//  CleanArchitectureSample
//

import Foundation

struct ClubViewModel: Identifiable {
  let id: ClubId
  let name: String
  let dateStr: String
  
  init(club: Club) {
    self.id = club.clubId
    self.name = club.name
    self.dateStr = ClubViewModel.dateFormatter.string(from: club.createdAt)
  }
  
  private static let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy年MM月dd日 HH:mm"
    return formatter
  }()
}


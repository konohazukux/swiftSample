//
//  ClubViewModel.swift
//  CleanArchitectureSample
//

import Foundation

struct ClubViewModel: Identifiable {
  let id: ClubId
  let name: String
  
  init(club: Club) {
    self.id = club.clubId
    self.name = club.name
  }
}


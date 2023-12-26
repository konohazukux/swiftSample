//
//  ClubViewModel.swift
//  CleanArchitectureSample
//

import Foundation

class ClubViewModel: ObservableObject {
  @Published var clubs: [Club] = []
  private let clubUseCase: ClubUseCase
  
  init(clubUseCase: ClubUseCase) {
    self.clubUseCase = clubUseCase
  }
 
  func addClub(name: String) {
    Task {
      let clubs = await self.clubUseCase.createClub(name: name)
      self.clubs = clubs
    }
  }
  
  func fetchClubs() {
    Task {
      self.clubs = await clubUseCase.findAllClubs()
    }
  }
}

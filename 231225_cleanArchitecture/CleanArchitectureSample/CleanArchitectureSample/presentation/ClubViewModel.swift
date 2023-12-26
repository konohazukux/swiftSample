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
    
  }
  
  func fetchClubs() {
    self.clubs = clubUseCase.findAllClubs()
  }
}

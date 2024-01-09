//
//  ClubViewModel.swift
//  CleanArchitectureSample
//

import Foundation

class ClubViewPresenter: ObservableObject {
  @Published var clubViewModels: [ClubViewModel] = []
  private let clubUseCase: ClubUseCase
  
  init(clubUseCase: ClubUseCase) {
    self.clubUseCase = clubUseCase
  }
 
  func addClub(name: String) {
    Task {
      let clubs = await self.clubUseCase.createClub(name: name)
      DispatchQueue.main.async {
        self.clubViewModels = clubs.map { ClubViewModel(club: $0) }
      }
    }
  }
  
  func fetchClubs() {
    Task {
      let clubs = await clubUseCase.findAllClubs()
      DispatchQueue.main.async {
        self.clubViewModels = clubs.map { ClubViewModel(club: $0) }
      }
    }
  }
}

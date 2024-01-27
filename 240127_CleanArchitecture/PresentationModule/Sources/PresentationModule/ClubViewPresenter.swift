//
//  ClubViewModel.swift
//  CleanArchitectureSample
//

import Foundation
import DomainModule

class ClubViewPresenter: ObservableObject {
  @Published var clubViewModels: [ClubViewModel] = []
  private let clubUseCase: ClubUseCase
  
  init(clubUseCase: ClubUseCase) {
    self.clubUseCase = clubUseCase
  }
  
  @MainActor
  func addClub(name: String) {
    Task {
      let clubs = await self.clubUseCase.createClub(name: name)
      self.clubViewModels = clubs.map { ClubViewModel(club: $0) }
    }
  }
  
  @MainActor
  func fetchClubs() {
    Task {
      let clubs = await clubUseCase.findAllClubs()
      self.clubViewModels = clubs.map { ClubViewModel(club: $0) }
    }
  }
}

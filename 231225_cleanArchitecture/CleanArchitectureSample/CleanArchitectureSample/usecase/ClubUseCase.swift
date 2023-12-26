//
//  ClubUseCase.swift
//  CleanArchitectureSample
//

import Foundation

class ClubUseCase {
  private let clubRepository: ClubRepository
  
  init(clubRepository: ClubRepository) {
    self.clubRepository = clubRepository
  }
 
  // Create Club
  func createClub(name: String) -> ClubId {
    let club = Club(name: name)
      clubRepository.save(club)
      return club.clubId
  }
  
  // Adds a student to a club
  func addStudent(clubId: ClubId, studentId: StudentId) throws {
    guard let club = clubRepository.findById(clubId) else {
      throw UseCaseException("the club is not found")
    }
    
    try club.addStudent(studentId)
    clubRepository.save(club)
  }
  
  // Approves a club if certain conditions are met
  func approveClub(clubId: ClubId) throws {
    guard let club = clubRepository.findById(clubId) else {
      throw UseCaseException("the club is not found")
    }
    
    try club.approve()
    clubRepository.save(club)
  }
  
  // Removes a student from a club
  func removeStudent(clubId: ClubId, studentId: StudentId) throws {
    guard let club = clubRepository.findById(clubId) else {
      throw UseCaseException("the club is not found")
    }
    
    club.removeStudent(studentId)
    clubRepository.save(club)
  }
}


// Assuming UserRepository, User, and UserId are defined elsewhere in your Swift code.


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
  func createClub(name: String) async -> [Club] {
    let club = Club(name: name)
    await clubRepository.save(club)
    let clubs = await findAllClubs()
    return clubs
  }
  
  func findAllClubs() async -> [Club] {
      return await clubRepository.findAll()
  }
  
  // Adds a student to a club
  func addStudent(clubId: ClubId, studentId: StudentId) async throws {
    guard let club = await clubRepository.findById(clubId) else {
      throw UseCaseException("the club is not found")
    }
    
    try club.addStudent(studentId)
    await clubRepository.save(club)
  }
  
  // Approves a club if certain conditions are met
  func approveClub(clubId: ClubId) async throws {
    guard let club = await clubRepository.findById(clubId) else {
      throw UseCaseException("the club is not found")
    }
    
    try club.approve()
    await clubRepository.save(club)
  }
  
  // Removes a student from a club
  func removeStudent(clubId: ClubId, studentId: StudentId) async throws {
    guard let club = await clubRepository.findById(clubId) else {
      throw UseCaseException("the club is not found")
    }
    
    club.removeStudent(studentId)
    await clubRepository.save(club)
  }
}




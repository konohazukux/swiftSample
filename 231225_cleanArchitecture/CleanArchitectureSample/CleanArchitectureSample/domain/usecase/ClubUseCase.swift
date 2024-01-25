//
//  ClubUseCase.swift
//  CleanArchitectureSample
//

import Foundation

class ClubUseCase {
  private let clubRepository: ClubRepository
  
  // クラブリポジトリの初期化
  init(clubRepository: ClubRepository) {
    self.clubRepository = clubRepository
  }
 
  // クラブを作成する
  func createClub(name: String) async -> [Club] {
    let club = Club(name: name)
    await clubRepository.save(club)
    let clubs = await findAllClubs()
    return clubs
  }
  
  // すべてのクラブを取得する
  func findAllClubs() async -> [Club] {
      return await clubRepository.findAll()
  }
  
  // クラブに生徒を追加する
  func addStudent(clubId: ClubId, studentId: StudentId) async throws {
    guard let club = await clubRepository.findById(clubId) else {
      throw UseCaseException("クラブが見つかりません")
    }
    
    try club.addStudent(studentId)
    await clubRepository.save(club)
  }
  
  // 特定の条件が満たされた場合にクラブを承認する
  func approveClub(clubId: ClubId) async throws {
    guard let club = await clubRepository.findById(clubId) else {
      throw UseCaseException("クラブが見つかりません")
    }
    
    try club.approve()
    await clubRepository.save(club)
  }
  
  // クラブから生徒を削除する
  func removeStudent(clubId: ClubId, studentId: StudentId) async throws {
    guard let club = await clubRepository.findById(clubId) else {
      throw UseCaseException("クラブが見つかりません")
    }
    
    club.removeStudent(studentId)
    await clubRepository.save(club)
  }
}

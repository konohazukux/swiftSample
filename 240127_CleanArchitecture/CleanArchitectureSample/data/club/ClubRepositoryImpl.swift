//
//  ClubRepositoryImpl.swift
//  CleanArchitectureSample
//

import Foundation

class ClubRepositoryImpl: ClubRepository {
  
  let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH:mm"
    return formatter
  }()
  
  func findById(_ clubId: ClubId) async -> Club? {
    let response = await RMStore.shared.findById(clubId: clubId)
    let club = response.flatMap { convertToClub(from: $0) }
    return club
  }
  
  func save(_ club: Club) async {
    let data = convertToClubResponse(club: club)
    await RMStore.shared.save(data)
  }
  
  func findAll() async -> [Club] {
    let response = await RMStore.shared.findAll()
    let clubs = response.compactMap { convertToClub(from: $0) }
    return clubs
  }
  
  // Club オブジェクトを ClubResponse に変換する関数
  private func convertToClubResponse(club: Club) -> ClubResponse {
    return ClubResponse(
      clubId: club.clubId,
      name: club.name,
      clubStatus: club.clubStatus,
      createdAt: dateFormatter.string(from: club.createdAt),
      studentIds: club.studentIds
    )
  }
  
  // ClubResponse オブジェクトを Club オブジェクトに変換する関数
  func convertToClub(from response: ClubResponse) -> Club? {
    guard let createdAt = dateFormatter.date(from: response.createdAt) else {
      return nil
    }

    return Club(
      clubId: response.clubId,
      name: response.name,
      clubStatus: response.clubStatus,
      createdAt: createdAt,
      studentIds: response.studentIds
    )
  }
  
}


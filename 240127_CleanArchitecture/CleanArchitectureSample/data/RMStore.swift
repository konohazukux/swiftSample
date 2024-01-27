//
//  RMStore.swift
//  CleanArchitectureSample
//

import Foundation
import DomainModule

class RMStore {
  private let defaults = UserDefaults.standard
  private let clubKey = "clubs"
  
  static let shared = RMStore()
  private init() {}
  
  func findById(clubId: ClubId) async -> ClubResponse? {
    guard let clubData = defaults.data(forKey: clubKey) else { return nil }
    let clubs = try? JSONDecoder().decode([ClubResponse].self, from: clubData)
    return clubs?.first(where: { $0.clubId == clubId })
  }
  
  func save(_ club: ClubResponse) async {
    var clubs = await findAll()
    if let index = clubs.firstIndex(where: { $0.clubId == club.clubId }) {
      clubs[index] = club
    } else {
      clubs.append(club)
    }
    if let encoded = try? JSONEncoder().encode(clubs) {
      defaults.set(encoded, forKey: clubKey)
    }
  }
  
  func findAll() async -> [ClubResponse] {
    guard let clubData = defaults.data(forKey: clubKey) else { return [] }
    return (try? JSONDecoder().decode([ClubResponse].self, from: clubData)) ?? []
  }
}

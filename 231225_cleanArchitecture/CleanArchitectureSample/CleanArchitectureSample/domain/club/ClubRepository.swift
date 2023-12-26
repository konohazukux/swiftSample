//
//  ClubRepository.swift
//  CleanArchitectureSample
//

import Foundation

protocol ClubRepository {
  func findById(_ clubId: ClubId) -> Club?
  func save(_ club: Club)
  func findAll() -> [Club]
}

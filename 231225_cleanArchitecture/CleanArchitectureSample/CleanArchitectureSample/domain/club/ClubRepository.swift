//
//  ClubRepository.swift
//  CleanArchitectureSample
//

import Foundation

protocol ClubRepository {
  func findById(_ clubId: ClubId) async -> Club?
  func save(_ club: Club) async
  func findAll() async -> [Club]
}

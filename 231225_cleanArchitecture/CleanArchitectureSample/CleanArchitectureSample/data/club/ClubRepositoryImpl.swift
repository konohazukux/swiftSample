//
//  ClubRepositoryImpl.swift
//  CleanArchitectureSample
//

import Foundation

class ClubRepositoryImpl: ClubRepository {
    private let defaults = UserDefaults.standard
    private let clubKey = "clubs"

    func findById(_ clubId: ClubId) -> Club? {
        guard let clubData = defaults.data(forKey: clubKey) else { return nil }
        let clubs = try? JSONDecoder().decode([Club].self, from: clubData)
        return clubs?.first(where: { $0.clubId == clubId })
    }

    func save(_ club: Club) {
        var clubs = findAll()
        if let index = clubs.firstIndex(where: { $0.clubId == club.clubId }) {
            clubs[index] = club
        } else {
            clubs.append(club)
        }
        if let encoded = try? JSONEncoder().encode(clubs) {
            defaults.set(encoded, forKey: clubKey)
        }
    }

    func findAll() -> [Club] {
        guard let clubData = defaults.data(forKey: clubKey) else { return [] }
        return (try? JSONDecoder().decode([Club].self, from: clubData)) ?? []
    }
}

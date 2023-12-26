//
//  ClubRepository.swift
//  CleanArchitectureSample
//
//  Created by TAKESHI SHIMADA on 2023/12/26.
//

import Foundation

protocol ClubRepository {
    func findById(_ clubId: ClubId) -> Club?
    func save(_ club: Club)
}

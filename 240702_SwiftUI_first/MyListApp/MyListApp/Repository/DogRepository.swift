//
//  DogRepository.swift
//  MyListApp
//
//  Created by TAKESHI SHIMADA on 2024/07/05.
//

import Foundation

class DogRepository {
  func getURL() async throws -> URL {
    let urlString = URLPath.dog(bread: "shiba")
    let imageUrl = try await ApiClient.fetchRandomShibaImage(urlString: urlString.path)
    return imageUrl
  }
  
}

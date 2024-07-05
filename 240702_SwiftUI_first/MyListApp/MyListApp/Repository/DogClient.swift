//
//  DogClient.swift
//  MyListApp
//
//  Created by TAKESHI SHIMADA on 2024/07/05.
//

import Foundation

struct DogClient {
  
  static func fetchRandomShibaImage() async throws -> URL {
    let urlString = "https://dog.ceo/api/breed/Shiba/images/random"
    guard let url = URL(string: urlString) else {
      throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
    }
    
    let (data, _) = try await URLSession.shared.data(from: url)
    
    guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
          let imageUrlString = json["message"] as? String,
          let imageUrl = URL(string: imageUrlString) else {
      throw NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid JSON structure"])
    }
    
    return imageUrl
  }
  
}

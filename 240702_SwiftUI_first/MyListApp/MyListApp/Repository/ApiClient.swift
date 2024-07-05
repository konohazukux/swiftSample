//
//  DogClient.swift
//  MyListApp
//
//  Created by TAKESHI SHIMADA on 2024/07/05.
//

import Foundation

struct ApiClient {
  
  static func fetchRandomShibaImage(urlString: String) async throws -> URL {
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

enum URLPath {
  case dog(bread: String)
  case cat
  
  var path: String {
    switch self {
    case .dog(let bread): return "https://dog.ceo/api/breed/\(bread)/images/random"
    case .cat: return ""
    }
  }
}

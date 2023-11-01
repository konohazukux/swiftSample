//
//  RMStore.swift
//  RMSample
//

import Foundation

final class RMStore {
  
  private let userFilename = "user.json"
  private let dataPath = "rmdata"
  private let transactionPath = "rmdata"
  
  func readUsers() -> [UserStoreModel] {
    //  readに関しては ローカル→APIで良いもの と 最新のものをAPIから取得するパターン ができるようにする
    //  読み込むモデルごとに どちらかを決めておく
    //
    // ローカル data storeにあるものを返す -> データを返す (reactive)
    // APIから読み込み
    // ローカル data storeに書き込み -> データを返す (reactive)
    
    
    do {
      let users = try loadFile(directory: dataPath, filename: userFilename)
      print("111 sdf\(#line) \(type(of: self))  \(#function) : \(users) ")
      
      return users
    } catch {
      print("Error load data: \(error)")
    }
    //    let user = UserStoreModel.init(id: 1, name: "user1")
    return []
  }
  
  func updateUser(user: UserStoreModel) {
    do {
      
      let users = try loadFile(directory: dataPath, filename: userFilename)
      print("111 sdf\(#line) \(type(of: self))  \(#function) : \(users) ")
      let newUsers = users.contains(where: { $0.id == user.id }) ?
      users.map { $0.id == user.id ? user : $0 } : users + [user]
      let encoder = JSONEncoder()
      let jsonData = try encoder.encode(newUsers)
      
      // save user data
      try saveFile(directory: dataPath, filename: userFilename, jsonData: jsonData)
      
      // transaction data
      let (jsonData2, filename) = try buildTransactionData(jsonData: jsonData)
      try saveFile(directory: transactionPath, filename: filename, jsonData: jsonData2)
      
    } catch {
      print("Error encoding and saving user data: \(error)")
    }
  }
  
  func deleteUser(user: UserStoreModel) {
    // 1. ローカル data storeから削除
    // 2. 差分を保持
  }
  
}






extension RMStore {
  
  private func getDocumentsDirectory() -> URL {
    // Fetch the document directory and return the URL
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
  }
  
  private func getCurrentDateString() -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyyMMddHHmmssSSS"
    return formatter.string(from: Date())
  }
  
  private func loadFile(directory: String, filename: String) throws -> [UserStoreModel] {
      let directoryURL = getDocumentsDirectory().appendingPathComponent(directory)
      let fileURL = directoryURL.appendingPathComponent(filename)
      
      // ファイルが存在するか確認
      if FileManager.default.fileExists(atPath: fileURL.path) {
        // ファイルの内容を読み込む
        let fileContents = try Data(contentsOf: fileURL)
        
        // JSONデータをUserStoreModelにデコード
        let decoder = JSONDecoder()
        let userModel = try decoder.decode([UserStoreModel].self, from: fileContents)
        return userModel
      } else {
          throw NSError(domain: "com.RMSample.error", code: -1, userInfo: ["message": "File not found"])
      }
  }
  
  private func saveFile(directory: String, filename: String, jsonData: Data) throws {
    //sdf
    let jsonString = String(data: jsonData, encoding: .utf8)
    let directoryURL = getDocumentsDirectory().appendingPathComponent(directory)
    let fileURL = directoryURL.appendingPathComponent(filename)
    
    // rmdataディレクトリが存在しない場合、ディレクトリを作成する
    if !FileManager.default.fileExists(atPath: directoryURL.path) {
      try FileManager.default.createDirectory(at: directoryURL, withIntermediateDirectories: true, attributes: nil)
    }
    
    try jsonString?.write(to: fileURL, atomically: true, encoding: .utf8)
  }
  
  private func buildTransactionData(jsonData: Data) throws -> (Data, String) {
    
    // transaction data
    //  array か dictionary で  [[String: Any]]  [String: Any]
    guard let userDictionary = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [[String: Any]] else {
      throw NSError.init(domain: "com.RMSample.error", code: 1001, userInfo: ["message": "Fail to convert jsonData to Dictionary"])
    }
    let transactionData: [String: Any] = [
      "method": "POST",
      "path": "/user",
      "data": userDictionary
    ]
    let jsonData2 = try JSONSerialization.data(withJSONObject: transactionData, options: .prettyPrinted)
   
    // filename
    let dateString = getCurrentDateString()
    let filename = "\(dateString).json"
    
    return (jsonData2, filename)
  }
  
}

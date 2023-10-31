//
//  RMStore.swift
//  RMSample
//

import Foundation

final class RMStore {
  
  func readUsers() -> [UserStoreModel] {
    //  readに関しては ローカル→APIで良いもの と 最新のものをAPIから取得するパターン ができるようにする
    //  読み込むモデルごとに どちらかを決めておく
    //
    // ローカル data storeにあるものを返す -> データを返す (reactive)
    // APIから読み込み
    // ローカル data storeに書き込み -> データを返す (reactive)
    
    let user = UserStoreModel.init(id: 1, name: "")
    return [user]
  }
  
  func updateUser(user: UserStoreModel) {
    do {
      let encoder = JSONEncoder()
      let jsonData = try encoder.encode(user)
     
      // save user data
      try saveFile(directory: "rmdata", filename: "user.json", jsonData: jsonData)
     
      // transaction data
      let (jsonData2, filename) = try buildTransactionData(jsonData: jsonData)
      try saveFile(directory: "transaction", filename: filename, jsonData: jsonData2)
      
    } catch {
      print("Error encoding and saving user data: \(error)")
    }
  }
 
  func deleteUser(user: UserStoreModel) {
    // 1. ローカル data storeから削除
    // 2. 差分を保持
  }
  
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
 
  private func saveFile(directory: String, filename: String, jsonData: Data) throws {
    //sdf
    let jsonString = String(data: jsonData, encoding: .utf8)
    let directoryURL = getDocumentsDirectory().appendingPathComponent(directory)
    let fileURL = directoryURL.appendingPathComponent(filename)
    
    // rmdataディレクトリが存在しない場合、ディレクトリを作成する
    if !FileManager.default.fileExists(atPath: directoryURL.path) {
      try FileManager.default.createDirectory(at: directoryURL, withIntermediateDirectories: true, attributes: nil)
    }
    
    print("111 sdf\(#line) \(type(of: self))  \(#function) : \(fileURL) ")
    try jsonString?.write(to: fileURL, atomically: true, encoding: .utf8)
  }
  
  private func buildTransactionData(jsonData: Data) throws -> (Data, String) {
    
    // transaction data
    guard let userDictionary = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] else {
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

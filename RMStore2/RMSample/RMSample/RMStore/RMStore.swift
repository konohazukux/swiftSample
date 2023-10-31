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
    // 1. userをjsonエンコードして、ローカルのファイルに書き込む
    //   ./rmdata/user.json
    let encoder = JSONEncoder()
    do {
      let jsonData = try encoder.encode(user)
      let jsonString = String(data: jsonData, encoding: .utf8)
      let directoryURL = getDocumentsDirectory().appendingPathComponent("rmdata")
      let fileURL = directoryURL.appendingPathComponent("user.json")
      
      // rmdataディレクトリが存在しない場合、ディレクトリを作成する
      if !FileManager.default.fileExists(atPath: directoryURL.path) {
        try FileManager.default.createDirectory(at: directoryURL, withIntermediateDirectories: true, attributes: nil)
      }
      
      print("111 sdf\(#line) \(type(of: self))  \(#function) : \(fileURL) ")
      try jsonString?.write(to: fileURL, atomically: true, encoding: .utf8)
    } catch {
      print("Error encoding user data: \(error)")
    }
    
    do {
      let jsonData = try encoder.encode(user)
      
      // jsonDataをDictionary型に変換
      guard let userDictionary = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] else {
        throw NSError.init(domain: "com.RMSample.error", code: 1001, userInfo: ["message": "Fail to convert jsonData to Dictionary"])
      }
     
      let transactionData: [String: Any] = [
        "method": "POST",
        "path": "/user",
        "data": userDictionary
      ]
      
      let dateString = getCurrentDateString()
      let directoryURL = getDocumentsDirectory().appendingPathComponent("transaction")
      let fileURL = directoryURL.appendingPathComponent("\(dateString).json")
      let jsonData2 = try JSONSerialization.data(withJSONObject: transactionData, options: .prettyPrinted)
      try jsonData2.write(to: fileURL)
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
  
}

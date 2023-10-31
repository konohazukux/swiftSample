//
//  RMStore.swift
//  RMSample
//

import Foundation

final class RMStore {

  
  func readUser() {
    //  readに関しては ローカル→APIで良いもの と 最新のものをAPIから取得するパターン ができるようにする
    //  読み込むモデルごとに どちらかを決めておく
    //
    // ローカル data storeにあるものを返す -> データを返す (reactive)
    // APIから読み込み
    // ローカル data storeに書き込み -> データを返す (reactive)
  }
  
  func updateUser(user: UserStoreModel) {
    // 1. ローカル data storeに保存
    // 2. 差分を保持
    // 3. APIを叩く
  }
  
  func deleteUser(user: UserStoreModel) {
    // 1. ローカル data storeから削除
    // 2. 差分を保持
    // 3. APIを叩く
  }
  
}

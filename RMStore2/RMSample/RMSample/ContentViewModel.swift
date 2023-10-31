//
//  ContentViewModel.swift
//  RMSample
//

import Foundation

class ContentViewModel {

  func updateUser() {
    let user = UserStoreModel.init(id: 1, name: "name1")
    let store = RMStore()
    store.updateUser(user: user)
  }
  
}

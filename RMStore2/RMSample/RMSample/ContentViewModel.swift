//
//  ContentViewModel.swift
//  RMSample
//

import Foundation

class ContentViewModel {

  func updateUser() {
    let user = UserStoreModel.init(id: 4, name: "name4a")
    let store = RMStore()
    store.updateUser(user: user)
    
//    let temp = store.readUsers()
  }
  
}

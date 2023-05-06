//
//  UsersViewModel.swift
//  Sample1128
//
//  Created by TAKESHI SHIMADA on 2023/04/20.
//  Copyright © 2023 TAKESHI SHIMADA. All rights reserved.
//

import Foundation
import Combine

class UsersViewModel: ObservableObject {
    @Published var users: [User] = []
    private var cancellables: Set<AnyCancellable> = []

    init() {
        loadData()
    }

    private func loadData() {
        let apiService = APIService()
        
        apiService.fetchUsers()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                }
            } receiveValue: { users in
                self.users = users
            }
            .store(in: &cancellables)
    }
}



//
//  ClubViewModel.swift
//  CleanArchitectureSample
//

import Foundation

class ClubViewModel: ObservableObject {
    @Published var clubs: [Club] = []

    // ここにビジネスロジックを実装
    func fetchClubs() {
        // クラブのデータを取得して、clubsに代入
    }
}

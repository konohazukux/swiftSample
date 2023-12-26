//
//  ClubView.swift
//  CleanArchitectureSample
//

import SwiftUI

struct ClubsListView: View {
  @ObservedObject var viewModel = ClubViewModel(
    clubUseCase: ClubUseCase(
      clubRepository: ClubRepositoryImpl()
    )
  )
  @State private var showingAlert = false
   @State private var name = ""
  
    var body: some View {
        NavigationView {
            List(viewModel.clubs) { club in
                ClubRow(club: club)
            }
            .navigationBarTitle("Clubs")
            .navigationBarItems(
              trailing:
                Button(action: {
                  self.showingAlert = true
                }) {
                  Image(systemName: "plus")
                }
            )
            .alert("クラブを追加", isPresented: $showingAlert) {
              TextField("クラブ名", text: $name)
              Button("OK", action: submit)
              Button("Cancel", action: { self.showingAlert = false})
            } message: {
              Text("追加するクラブの名前を入力してください")
            }
            .onAppear {
                viewModel.fetchClubs()
            }
        }
    }
  
  func submit() {
    
  }
}

struct ClubRow: View {
    var club: Club

    var body: some View {
        Text(club.name)
    }
}


#Preview {
  ClubsListView()
}


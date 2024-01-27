//
//  ClubView.swift
//  CleanArchitectureSample
//

import SwiftUI
import DomainModule

struct ClubsListView: View {
  @ObservedObject var viewModel = ClubViewPresenter(
    clubUseCase: ClubUseCase(
      clubRepository: ClubRepositoryImpl()
    )
  )
  @State private var showingAlert = false
  @State private var name = ""
  
  var body: some View {
    NavigationView {
      List(viewModel.clubViewModels) { club in
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
        Button("OK", action: {
          viewModel.addClub(name: name)
          self.showingAlert = false
          name = "" // テキストフィールドをリセット
        })
        Button("Cancel", action: { self.showingAlert = false})
      } message: {
        Text("追加するクラブの名前を入力してください")
      }
      .onAppear {
        viewModel.fetchClubs()
      }
    }
  }
}

struct ClubRow: View {
  var club: ClubViewModel
  
  var body: some View {
    HStack {
      Text(club.name)
      Spacer()
      Text(club.dateStr)
    }
  }
}


#Preview {
  ClubsListView()
}


//
//  ClubView.swift
//  CleanArchitectureSample
//

import SwiftUI

struct ClubsListView: View {
    @ObservedObject var viewModel = ClubViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.clubs) { club in
                ClubRow(club: club)
            }
            .navigationBarTitle("Clubs")
            .onAppear {
                viewModel.fetchClubs()
            }
        }
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


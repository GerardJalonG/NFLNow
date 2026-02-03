//
//  adding_team.swift
//  NBANow
//
//  Created by Dean Martin Garcia on 1/2/26.
//

import SwiftUI
import KingfisherSwiftUI

struct AddingTeamsView: View {

    @EnvironmentObject var teamStore: TeamStore
    @StateObject private var teamsViewModel = ViewModel()

    @State private var maxTeamsAlert = false

    private var teams: [Team] {
        teamsViewModel.teams
    }

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {

                    Divider()

                    Text("Following")
                        .foregroundColor(.gray)
                        .font(.title3)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 12)

                    ScrollView(.horizontal) {
                        HStack(spacing: 12) {
                            ForEach(teamStore.teamIDs, id: \.self) { id in
                                if let team = teams.first(where: { $0.id == id }),
                                   let logoURL = team.logos.first?.href,
                                   let url = URL(string: logoURL) {

                                    KFImage(url)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 52, height: 52)

                                } else {
                                    Rectangle()
                                        .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                                        .frame(width: 52, height: 52)
                                }
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.bottom, 12)
                    }

                    Divider()

                    ForEach(teams) { team in
                        TeamRowView(
                            team: team,
                            isFollowing: teamStore.isFollowing(team),
                            anadir: {
                                let added = teamStore.add(team)
                                if !added {
                                    maxTeamsAlert = true
                                }
                            },
                            eliminar: {
                                teamStore.remove(team)
                            }
                        )

                        Divider()
                            .padding(.leading, 16)
                    }
                }
            }
            .navigationTitle("My Teams")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                if teams.isEmpty {
                    teamsViewModel.fetchAllTeams()
                }
            }
        }
        .alert(isPresented: $maxTeamsAlert) {
            Alert(
                title: Text("¡Has alcanzado el máximo de equipos!"),
                message: Text("Solo puedes añadir hasta 5 equipos..."),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

struct AddingTeamsView_Previews: PreviewProvider {
    static var previews: some View {
        AddingTeamsView()
            .environmentObject(TeamStore())
    }
}

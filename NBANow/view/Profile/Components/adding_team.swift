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

    @State private var limitError: LimitReachedError?
    

    private var teams: [Team] {
        teamsViewModel.teams
    }

    var body: some View {
        
        let teamsPorLetra = Dictionary(grouping: teams) { team in
            team.displayName.first!
        }
        let letrasOrdenadas = teamsPorLetra.keys.sorted()
        
        NavigationView {
            List {
                Section {
                    ScrollView(.horizontal, showsIndicators: false) {
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
                        .padding(.vertical, 8)
                    }
                } header: {
                    Text("Following")
                        .foregroundColor(.gray)
                        .font(.title3)
                        .padding(.top, 4)
                }

                Section {
                    ForEach(letrasOrdenadas, id: \.self) { letra in
                        Section(header: Text(String(letra))) {
                            ForEach(teamsPorLetra[letra]!) { team in
                                TeamRowView(
                                    team: team,
                                    isFollowing: teamStore.isFollowing(team),
                                    anadir: { teamStore.add(team) },
                                    eliminar: { teamStore.remove(team) }
                                )
                            }
                        }
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("My Teams")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                if teams.isEmpty {
                    teamsViewModel.fetchAllTeams()
                }
            }
        }
        .alert(item: $limitError) { error in
            Alert(
                title: Text(error.title),
                message: Text(error.message),
                dismissButton: .default(Text("Ok"))
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

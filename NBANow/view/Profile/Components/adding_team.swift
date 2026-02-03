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

    let teams: [Team]

    @State private var maxTeamsAlert = false

    private var teamsByConference: [String: [Team]] {
        Dictionary(grouping: teams) { $0.conference }
    }

    private let order = ["NFC", "AFC"]

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
                            ForEach(teamStore.teamIDs, id: \.self) { id  in
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

                    ForEach(order, id: \.self) { conf in
                        if let confTeams = teamsByConference[conf] {

                            Text(conf)
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundColor(.gray)
                                .padding(.horizontal, 16)
                                .padding(.top, 14)
                                .padding(.bottom, 8)

                            ForEach(confTeams) { team in
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

                            Spacer().frame(height: 10)
                        }
                    }
                }
            }
            .navigationTitle("My Teams")
            .navigationBarTitleDisplayMode(.inline)
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
        AddingTeamsView(teams: Team.mockTeams)
            .environmentObject(TeamStore())
    }
}

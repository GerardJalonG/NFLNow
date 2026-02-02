//
//  adding_teamOfSeason.swift
//  NBANow
//
//  Created by Dean Martin Garcia on 1/2/26.
//

import SwiftUI
import KingfisherSwiftUI

struct AddingTeamOfTheSeasonView: View {

    @EnvironmentObject var store: TeamOfSeasonStore

    @State private var maxPlayersAlert = false

    private let players: [PlayerListItem] = PlayerListItem.mockTeamOfTheSeason

    private var playersByTeam: [String: [PlayerListItem]] {
        Dictionary(grouping: players) { $0.teamName }
    }

    private var sortedTeams: [String] {
        playersByTeam.keys.sorted()
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
                            ForEach(store.playerIDs, id: \.self) { id in
                                if let player = players.first(where: { $0.id == id }),
                                   let imageURL = player.headshotURL,
                                   let url = URL(string: imageURL) {
                                    KFImage(url)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 52, height: 52)
                                        .clipShape(Circle())
                                } else {
                                    Circle()
                                        .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                                        .frame(width: 52, height: 52)
                                }
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.bottom, 12)
                    }

                    Divider()

                    ForEach(sortedTeams, id: \.self) { teamName in

                        Text(teamName)
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                            .padding(.horizontal, 16)
                            .padding(.top, 14)
                            .padding(.bottom, 8)

                        if let teamPlayers = playersByTeam[teamName] {
                            ForEach(teamPlayers) { player in

                                PlayerRowView(
                                    player: player,
                                    isFollowing: store.isFollowing(player),
                                    anadir: {
                                        let added = store.add(player)

                                        if !added {
                                            maxPlayersAlert = true
                                        }
                                    },
                                    eliminar: {
                                        store.remove(player)
                                    }
                                )

                                Divider()
                                    .padding(.leading, 16)
                            }
                        }

                        Spacer().frame(height: 10)
                    }
                }
            }
            .navigationTitle("Team of the Season")
            .navigationBarTitleDisplayMode(.inline)
        }
        .alert(isPresented: $maxPlayersAlert) {
            Alert(
                title: Text("¡Has alcanzado el máximo de jugadores!"),
                message: Text("Solo puedes añadir hasta 5 jugadores..."),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

struct AddingTeamOfTheSeasonView_Previews: PreviewProvider {
    static var previews: some View {
        AddingTeamOfTheSeasonView()
            .environmentObject(TeamOfSeasonStore())
    }
}

//
//  adding_players.swift
//  NBANow
//
//  Created by Dean Martin Garcia on 31/1/26.
//

import SwiftUI
import KingfisherSwiftUI

struct AddingPlayersView: View {

    private let players: [PlayerListItem] = PlayerListItem.mockPlayers

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

                                HStack(spacing: 12) {
                                    if let imageURL = player.headshotURL,
                                       let url = URL(string: imageURL) {
                                        KFImage(url)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 40, height: 40)
                                            .clipShape(Circle())
                                    } else {
                                        Circle()
                                            .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                                            .frame(width: 40, height: 40)
                                    }

                                    VStack(alignment: .leading, spacing: 4) {

                                        Text(player.name)
                                            .font(.body)
                                            .fontWeight(.semibold)

                                        Text("\(player.teamAbbreviation)  #\(player.jersey)  \(player.position)")
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                    }

                                    Spacer()
                                }
                                .padding(.horizontal, 16)
                                .padding(.vertical, 10)

                                Divider()
                                    .padding(.leading, 16)
                            }
                        }

                        Spacer().frame(height: 10)
                    }
                }
            }
            .navigationTitle("My Players")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct AddingPlayersView_Previews: PreviewProvider {
    static var previews: some View {
        AddingPlayersView()
    }
}

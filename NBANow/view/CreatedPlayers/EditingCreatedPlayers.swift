//
//  EditingCreatedPlayers.swift
//  NBANow
//
//  Created by Dean Martin Garcia on 3/2/26.
//

import SwiftUI

struct EditingPlayersView: View {

    @EnvironmentObject var playerStore: PlayerStore

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
                            ForEach(playerStore.players) { player in
                                ZStack {
                                    Circle()
                                        .fill(Color.gray.opacity(0.2))

                                    Text(player.avatar.rawValue)
                                        .font(.title2)
                                }
                                .frame(width: 52, height: 52)
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.bottom, 12)
                    }

                    Divider()

                    ForEach(playerStore.players) { player in
                        PlayerRowView(
                            player: player,
                            eliminar: {
                                playerStore.remove(id: player.id)
                            }
                        )

                        Divider()
                            .padding(.leading, 16)
                    }
                }
            }
            .navigationTitle("My Players")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct EditingPlayersView_Previews: PreviewProvider {
    static var previews: some View {
        EditingPlayersView()
            .environmentObject(PlayerStore())
    }
}

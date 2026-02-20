//
//  EditingCreatedPlayers.swift
//  NBANow
//
//  Created by Dean Martin Garcia on 3/2/26.
//

import SwiftUI

struct EditingCreatedPlayersView: View {

    @EnvironmentObject var playerStore: PlayerStore

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {

                    Divider()

                    Text("Following")
                        .foregroundColor(.gray)
                        .font(.title3)
                        .padding(.horizontal, UI.Sizes.extraLarge)
                        .padding(.vertical, UI.Sizes.large)

                    ScrollView(.horizontal) {
                        HStack(spacing: UI.Sizes.large) {
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
                        .padding(.horizontal, UI.Sizes.extraLarge)
                        .padding(.bottom, UI.Sizes.large)
                    }

                    Divider()

                    ForEach(playerStore.players) { player in
                        TemplateDeletingPlayers(
                            player: player,
                            eliminar: {
                                playerStore.remove(id: player.id)
                            }
                        )

                        Divider()
                            .padding(.leading, UI.Sizes.extraLarge)
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
        EditingCreatedPlayersView()
            .environmentObject(PlayerStore())
    }
}

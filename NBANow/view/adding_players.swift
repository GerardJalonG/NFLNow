import SwiftUI
import KingfisherSwiftUI

struct AddingPlayersView: View {

    @EnvironmentObject var store: FollowingPlayersStore

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
                    
                    Divider()

                    Text("Following")
                        .foregroundColor(.gray)
                        .font(.title3)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 12)

                    ScrollView(.horizontal) {
                        HStack(spacing: 12) {
                            ForEach(store.players) { player in
                                if let imageURL = player.headshotURL,
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
                                    isFollowing: store.players.contains(where: { $0.id == player.id }),
                                    anadir: {
                                        let added = store.add(playerAdded: player)
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
            .navigationTitle("My Players")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct AddingPlayersView_Previews: PreviewProvider {
    static var previews: some View {
        AddingPlayersView()
            .environmentObject(FollowingPlayersStore())
    }
}

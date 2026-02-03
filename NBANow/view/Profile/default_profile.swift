
import SwiftUI
import KingfisherSwiftUI

struct default_profile: View {
    
    @EnvironmentObject var teamStore: TeamStore
    @EnvironmentObject var storePlayers: FollowingPlayersStore

    private let teams = Team.mockTeams
    private let players = PlayerListItem.mockPlayers
    private let seasonPlayers = PlayerListItem.mockTeamOfTheSeason

    @State private var showTeams = false
    @State private var showPlayers = false
    @State private var showSeason = false

    var body: some View {
        VStack(alignment: .leading) {

            profile_row(
                title: "MY TEAMS",
                showEdit: !teamStore.teamIDs.isEmpty,
                action: { showTeams = true }
            )

            ScrollView(.horizontal) {
                HStack(spacing: 12) {
                    ForEach(teamStore.teamIDs, id: \.self) { id in
                        if let team = teams.first(where: { $0.id == id }),
                           let logo = team.logos.first?.href,
                           let url = URL(string: logo) {
                            KFImage(url)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 52, height: 52)
                        }
                    }
                }
                .padding(.horizontal, 16)
            }

            profile_row(
                title: "MY PLAYERS",
                showEdit: !storePlayers.playerIDs.isEmpty,
                action: { showPlayers = true }
            )

            ScrollView(.horizontal) {
                HStack(spacing: 12) {
                    ForEach(storePlayers.playerIDs, id: \.self) { id in
                        if let player = players.first(where: { $0.id == id }),
                           let image = player.headshotURL,
                           let url = URL(string: image) {
                            KFImage(url)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 52, height: 52)
                                .clipShape(Circle())
                        }
                    }
                }
                .padding(.horizontal, 16)
            }
        }
        .sheet(isPresented: $showTeams) {
            AddingTeamsView(teams: teams)
        }
    }
}

#Preview {
    default_profile()
        .environmentObject(TeamStore())
        .environmentObject(FollowingPlayersStore())
}

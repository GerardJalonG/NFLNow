import SwiftUI
import KingfisherSwiftUI

struct default_profile: View {

    @EnvironmentObject var teamStore: TeamStore
    @EnvironmentObject var storePlayers: FollowingPlayersStore
    @EnvironmentObject var teamOfSeason: TeamOfSeasonStore

    private let teams = Team.mockTeams
    private let players = PlayerListItem.mockPlayers
    private let seasonPlayers = PlayerListItem.mockTeamOfTheSeason

    @State private var showTeams = false
    @State private var showPlayers = false
    @State private var showSeason = false

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {

                    profile_row(
                        title: "MY TEAMS",
                        showEdit: !teamStore.teamIDs.isEmpty,
                        action: { showTeams = true }
                    )
                    .padding(.top, 24)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 18) {
                            ForEach(teamStore.teamIDs, id: \.self) { id in
                                if let team = teams.first(where: { $0.id == id }),
                                   let logo = team.logos.first?.href,
                                   let url = URL(string: logo) {

                                    NavigationLink(destination: team_info(team: team)) {
                                        KFImage(url)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 56, height: 56)
                                    }

                                } else {
                                    Rectangle()
                                        .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                                        .frame(width: 56, height: 56)
                                }
                            }
                        }
                        .padding(.horizontal, 30)
                        .padding(.top, 12)
                        .padding(.bottom, 26)
                    }

                    profile_row(
                        title: "MY PLAYERS",
                        showEdit: !storePlayers.playerIDs.isEmpty,
                        action: { showPlayers = true }
                    )
                    .padding(.top, 6)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 18) {
                            ForEach(storePlayers.playerIDs, id: \.self) { (id: String) in
                                if let player = players.first(where: { $0.id == id }) {
                                    NavigationLink(destination: player_info(player: player)) {
                                        if let image = player.headshotURL,
                                           let url = URL(string: image) {
                                            KFImage(url)
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 56, height: 56)
                                                .clipShape(Circle())
                                        } else {
                                            Circle()
                                                .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                                                .frame(width: 56, height: 56)
                                        }
                                    }
                                } else {
                                    Circle()
                                        .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                                        .frame(width: 56, height: 56)
                                }
                            }
                        }
                        .padding(.horizontal, 30)
                        .padding(.top, 12)
                        .padding(.bottom, 26)
                    }

                    profile_row(
                        title: "MY TEAM OF THE SEASON",
                        showEdit: !teamOfSeason.playerIDs.isEmpty,
                        action: { showSeason = true }
                    )
                    .padding(.top, 6)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 18) {
                            ForEach(teamOfSeason.playerIDs, id: \.self) { id in
                                if let player = seasonPlayers.first(where: { $0.id == id }) {

                                    NavigationLink(destination: player_info(player: player)) {
                                        if let image = player.headshotURL,
                                           let url = URL(string: image) {
                                            KFImage(url)
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 56, height: 56)
                                                .clipShape(Circle())
                                        } else {
                                            Circle()
                                                .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                                                .frame(width: 56, height: 56)
                                        }
                                    }

                                } else {
                                    Circle()
                                        .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                                        .frame(width: 56, height: 56)
                                }
                            }
                        }
                        .padding(.horizontal, 30)
                        .padding(.top, 12)
                        .padding(.bottom, 40)
                    }
                }
            }
            .sheet(isPresented: $showTeams) { AddingTeamsView(teams: teams) }
            .sheet(isPresented: $showPlayers) { AddingPlayersView() }
            .sheet(isPresented: $showSeason) { AddingTeamOfTheSeasonView() }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

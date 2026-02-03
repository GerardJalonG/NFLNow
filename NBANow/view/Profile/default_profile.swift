import SwiftUI
import KingfisherSwiftUI

struct default_profile: View {

    @EnvironmentObject var teamStore: TeamStore
    @EnvironmentObject var createdPlayersStore: PlayerStore

    @StateObject private var teamsViewModel = ViewModel()

    private var teams: [Team] { teamsViewModel.teams }

    @State private var showTeams = false
    @State private var showPlayers = false

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
                showEdit: !createdPlayersStore.players.isEmpty,
                action: { showPlayers = true }
            )

            ScrollView(.horizontal) {
                HStack(spacing: 12) {
                    ForEach(createdPlayersStore.players) { p in
                        ZStack {
                            Circle().fill(Color.gray.opacity(0.2))
                            Text(String(p.name.prefix(1)).uppercased())
                                .font(.headline)
                        }
                        .frame(width: 52, height: 52)
                    }
                }
                .padding(.horizontal, 16)
            }
        }
        .onAppear {
            if teams.isEmpty {
                teamsViewModel.fetchAllTeams()
            }
        }
        .sheet(isPresented: $showTeams) {
            AddingTeamsView()
        }
        //.sheet(isPresented: $showPlayers) {
         //   AddingPlayersView()
        //}
    }
}

#Preview {
    default_profile()
        .environmentObject(TeamStore())
        .environmentObject(PlayerStore())
}

import SwiftUI
import KingfisherSwiftUI

struct PersonalProfile: View {

    @EnvironmentObject var teamStore: TeamStore
    @EnvironmentObject var createdPlayersStore: PlayerStore

    @StateObject private var teamsViewModel = ViewModel()
    private var teams: [Team] { teamsViewModel.teams }

    @State private var showTeams = false
    @State private var showPlayers = false
    @State private var showEditPlayers = false
    @State private var limitError: LimitReachedError?

    var body: some View {
        NavigationView {
            ZStack {
                Color(.systemBackground).ignoresSafeArea()

                ScrollView {
                    VStack(alignment: .leading, spacing: UI.Sizes.extraLarge) {
                        
                        Text("Profile")
                            .font(.largeTitle).bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, UI.Sizes.section)
                            .foregroundColor(Color(.label))

                        TemplateMyTeamsTitle(
                            title: "MY TEAMS",
                            showEdit: !teamStore.teamIDs.isEmpty,
                            action: { showTeams = true }
                        )

                        ScrollView(.horizontal, showsIndicators: false) {
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
                            .padding(.horizontal, UI.Sizes.extraLarge)
                        }

                        TemplateMyPlayersTitle(
                            title: "MY PLAYERS",
                            showEdit: !createdPlayersStore.players.isEmpty,
                            onEdit: { showEditPlayers = true },
                            onAdd: {
                                if createdPlayersStore.players.count >= 5 {
                                    limitError = .maxPlayers
                                } else {
                                    showPlayers = true
                                }
                            }
                        )

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: UI.Sizes.large) {
                                ForEach(createdPlayersStore.players) { player in
                                    ZStack {
                                        Circle().fill(Color.gray.opacity(0.2))
                                        Text(player.avatar.rawValue)
                                            .font(.title2)
                                    }
                                    .frame(width: 52, height: 52)
                                }
                            }
                            .padding(.horizontal, UI.Sizes.extraLarge)
                        }

                        Spacer()
                    }
                    .padding(.vertical, UI.Sizes.section)
                }
            }
            .navigationBarTitle("", displayMode: .inline)
            .onAppear {
                if teams.isEmpty {
                    teamsViewModel.fetchAllTeams()
                }
            }
            .sheet(isPresented: $showTeams) {
                AddingTeamsView()
            }
            .sheet(isPresented: $showPlayers) {
                AddingPlayersView(isPresented: $showPlayers)
                    .environmentObject(createdPlayersStore)
            }
            .sheet(isPresented: $showEditPlayers) {
                EditingCreatedPlayersView()
                    .environmentObject(createdPlayersStore)
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
}

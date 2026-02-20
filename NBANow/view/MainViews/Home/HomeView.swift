import SwiftUI

struct HomeView: View {

    @EnvironmentObject var teamStore: TeamStore
    @StateObject private var teamsViewModel = ViewModel()

    @EnvironmentObject var playerStore: PlayerStore

    @State private var addTeams = false
    @State private var addPlayers = false

    private var teams: [Team] { teamsViewModel.teams }

    var body: some View {
        NavigationView {
            ZStack {
                Color(.systemBackground).ignoresSafeArea()

                ScrollView {
                    VStack(spacing: UI.Sizes.extraLarge) {

                        Text("Home")
                            .font(.largeTitle).bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, UI.Sizes.page)
                            .foregroundColor(Color(.label))

                        sectionTitle("Players")

                        if playerStore.players.isEmpty {
                            Text("No players created")
                                .foregroundColor(Color(.secondaryLabel))
                                .padding(.top, UI.Sizes.regular)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .padding(.horizontal, UI.Sizes.page)
                            
                            Button(action: { addPlayers = true }) {
                                Text("Create Player")
                                    .font(.body)
                                    .foregroundColor(Color(.systemBlue)
                            )}
                        } else {
                            ForEach(playerStore.players, id: \.id) { player in
                                PlayerHomeCard(player: player)
                                    .padding(.horizontal, UI.Sizes.page)
                            }
                        }

                        Divider()
                            .padding(.horizontal, UI.Sizes.page)
                            .padding(.top, UI.Sizes.medium)

                        sectionTitle("Teams")

                        if teamStore.teamIDs.isEmpty {
                            VStack(spacing: 10) {
                                Text("No teams selected")
                                    .foregroundColor(Color(.secondaryLabel))
                                    .padding(.top, 10)

                                Button(action: { addTeams = true }) {
                                    Text("Add teams")
                                        .font(.body)
                                        .foregroundColor(Color(.systemBlue))
                                }
                                .padding(.top, UI.Sizes.regular)
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.horizontal, UI.Sizes.page)
                        } else {
                            ForEach(teamStore.teamIDs, id: \.self) { id in
                                if let team = teams.first(where: { $0.id == id }) {
                                    TeamHomeCard(team: team)
                                        .padding(.horizontal, UI.Sizes.page)
                                }
                            }
                        }
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
            .sheet(isPresented: $addTeams) {
                AddingTeamsView()
            }
            .sheet(isPresented: $addPlayers) {
                AddingPlayersView(isPresented: $addPlayers)
            }
        }
    }
    
    private func sectionTitle(_ text: String) -> some View {
        Text(text)
            .font(.title3).bold()
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 20)
            .foregroundColor(Color(.label))
            .padding(.top, 6)
    }
}


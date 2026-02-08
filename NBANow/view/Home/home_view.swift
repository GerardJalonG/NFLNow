import SwiftUI

struct home_view: View {

    @EnvironmentObject var teamStore: TeamStore
    @StateObject private var teamsViewModel = ViewModel()

    @State private var showTeams = false

    private var teams: [Team] { teamsViewModel.teams }

    var body: some View {
        NavigationView {
            ZStack {
                Color(.systemBackground).ignoresSafeArea()

                ScrollView {
                    VStack(spacing: 16) {

                        Text("Home")
                            .font(.largeTitle).bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 20)
                            .foregroundColor(Color(.label))

                        if teamStore.teamIDs.isEmpty {
                            VStack(spacing: 10) {
                                Text("No teams selected")
                                    .foregroundColor(Color(.secondaryLabel))
                                    .padding(.top, 40)

                                Button(action: { showTeams = true }) {
                                    Text("Añadir equipos favoritos")
                                        .font(.body)
                                        .foregroundColor(Color(.systemBlue))
                                }
                                .padding(.top, 6)
                            }
                            .frame(maxWidth: .infinity)
                        } else {
                            ForEach(teamStore.teamIDs, id: \.self) { id in
                                if let team = teams.first(where: { $0.id == id }) {
                                    TeamHomeCard(team: team)
                                        .padding(.horizontal, 20)
                                }
                            }
                        }
                    }
                    .padding(.vertical, 24)
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
        }
    }
}

#Preview {
    home_view()
        .environmentObject(TeamStore())
}

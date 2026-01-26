import SwiftUI
import KingfisherSwiftUI

struct adding_teams: View {
    @StateObject private var viewModel = ViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.teams, id: \.id) { team in
                NavigationLink(destination: team_info(team: team)) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(team.displayName)
                                .font(.headline)
                            Text(team.location)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.vertical, 4)
                }
            }
            .navigationTitle("MY TEAMS")
            .onAppear {
                viewModel.fetchAllTeams()
            }
        }
    }
}
extension String: Identifiable {
    public var id: String { self }
}

struct TeamsView_Previews: PreviewProvider {
    static var previews: some View {
        adding_teams()
    }
}

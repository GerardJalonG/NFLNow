import SwiftUI

struct adding_teams: View {
    @StateObject private var viewModel = ViewModel()

    var body: some View {
        NavigationView {
            VStack (alignment: .center){
                

                List(viewModel.teams, id: \.id) { team in
                    LazyVStack(alignment: .leading) {
                        Text(team.displayName)
                            .font(.headline)
                        Text(team.location)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                .navigationTitle("MY TEAMS")
                .onAppear {
                    viewModel.fetchAllTeams()
                }
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

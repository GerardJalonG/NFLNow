import SwiftUI

struct TeamsView: View {
    @StateObject private var viewModel = ViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.teams, id: \.id) { team in
                LazyVStack(alignment: .leading) {
                    Text(team.displayName)
                        .font(.headline)
                    Text(team.location)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .navigationTitle("NFL Teams")
            .onAppear {
                viewModel.fetchIntent()
            }
        }
    }
}
extension String: Identifiable {
    public var id: String { self }
}

struct TeamsView_Previews: PreviewProvider {
    static var previews: some View {
        TeamsView()
    }
}

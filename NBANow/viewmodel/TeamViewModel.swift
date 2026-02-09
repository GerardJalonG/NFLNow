import Foundation

final class TeamDetailViewModel: ObservableObject {
    @Published private(set) var messageError: String?
    @Published private(set) var team: Team?

    private let baseURL = "https://site.api.espn.com/apis/site/v2/sports/football/nfl"

    func fetchTeam(id: String) {
        let urlString = "\(baseURL)/teams/\(id)"

        NFLService.fetchTeamDetails(urlString: urlString) { result in
            switch result {
            case .failure(let error):
                DispatchQueue.main.async {
                    self.messageError = error.localizedDescription
                    self.team = nil
                }

            case .success(let team):
                DispatchQueue.main.async {
                    self.team = team
                    self.messageError = nil
                }
            }
        }
    }
}

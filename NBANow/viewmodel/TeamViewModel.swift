import Foundation

final class TeamDetailViewModel: ObservableObject {
    @Published private(set) var messageError: String?
    @Published private(set) var team: Team?

    private let apiurl = "https://site.api.espn.com/apis/site/v2/sports/football/nfl"

    func fetchTeam(id: String) {
        NFLService.fetchTeamDetails(urlString: apiurl, id: id) { result in
            switch result {
            case .failure(let error):
                DispatchQueue.main.async {
                    self.messageError = error.localizedDescription
                }
            case .success(let team):
                DispatchQueue.main.async {
                    self.team = team
                }
            }
        }
    }
}

import Foundation

final class TeamDetailViewModel: ObservableObject {
    @Published private(set) var messageError: String?
    @Published private(set) var team: Team?

    func fetchTeam(id: String) {
        if ScreenshotConfiguration.isEnabled {
            team = ScreenshotDemoData.teamDetail
            messageError = nil
            return
        }
        
        NFLService.fetchTeamDetails(teamId: id) { result in
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

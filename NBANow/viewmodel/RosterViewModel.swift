import Foundation

final class RosterViewModel: ObservableObject {
    @Published private(set) var messageError: String?
    @Published private(set) var roster: Roster?

    func fetchRoster(teamId: String) {
        if ScreenshotConfiguration.isEnabled {
            roster = ScreenshotDemoData.roster
            messageError = nil
            return
        }

        NFLService.fetchTeamRosterGroups(teamId: teamId) { result in
            switch result {
            case .failure(let error):
                DispatchQueue.main.async {
                    self.messageError = error.localizedDescription
                    self.roster = nil
                }

            case .success(let roster):
                DispatchQueue.main.async {
                    self.roster = roster
                    self.messageError = nil
                }
            }
        }
    }
}

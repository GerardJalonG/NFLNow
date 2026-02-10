import Foundation

final class ScoreBoardViewModel: ObservableObject {
    @Published private(set) var messageError: String?
    @Published private(set) var sb: ScoreBoardResponse?

    func fetchScoreBoard() {
        NFLService.fetchGameScoreboard { result in
            switch result {
            case .failure(let error):
                DispatchQueue.main.async {
                    self.messageError = error.localizedDescription
                    self.sb = nil
                }

            case .success(let sb):
                DispatchQueue.main.async {
                    self.sb = sb
                    self.messageError = nil
                }
            }
        }
    }
}

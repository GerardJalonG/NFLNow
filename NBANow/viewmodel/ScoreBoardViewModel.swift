import Foundation

final class ScoreBoardViewModel: ObservableObject {
    @Published private(set) var messageError: String?
    @Published private(set) var sb: ScoreBoardResponse?
    @Published private(set) var summary: GameSummaryData?
    @Published private(set) var summaryError: String?

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
    
    func fetchSummary(eventId: String) {
        NFLService.fetchSummary(eventId: eventId) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let summary):
                    self.summary = summary
                    self.summaryError = nil

                case .failure(let err):
                    self.summary = nil
                    self.summaryError = err.localizedDescription
                }
            }
        }
    }
}

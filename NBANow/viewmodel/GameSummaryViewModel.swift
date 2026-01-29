//
//  GameSummaryViewModel.swift
//  NBANow
//
//  Created by Dean Martin Garcia on 29/1/26.
//

import Foundation

class GameSummaryViewModel: ObservableObject {
    @Published private(set) var messageError: String?
    @Published private(set) var summary: GameSummaryData?

    func fetchGameSummary(eventId: String) {
        let apiurl = "https://site.api.espn.com/apis/site/v2/sports/football/nfl"

        NFLService.fetchGameSummary(urlString: apiurl, eventId: eventId) { result in
            switch result {
            case .failure(let error):
                DispatchQueue.main.async {
                    self.messageError = error.localizedDescription
                    self.summary = nil
                }

            case .success(let summary):
                DispatchQueue.main.async {
                    self.summary = summary
                    self.messageError = nil
                }
            }
        }
    }
}

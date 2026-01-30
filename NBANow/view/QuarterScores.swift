//
//  QuarterScores.swift
//  NBANow
//
//  Created by Dean Martin Garcia on 30/1/26.
//

import SwiftUI
import Foundation
import KingfisherSwiftUI

struct QuarterScoresView: View {

    let competition: GameCompetition

    private var away: GameCompetitor? {
        competition.competitors.first { $0.homeAway == "away" }
    }

    private var home: GameCompetitor? {
        competition.competitors.first { $0.homeAway == "home" }
    }

    var body: some View {
        VStack(spacing: 14) {
            HStack {
                Spacer()
                    .frame(width: 40)

                Text("Q1").frame(width: 44)
                Text("Q2").frame(width: 44)
                Text("Q3").frame(width: 44)
                Text("Q4").frame(width: 44)
                Text("T").frame(width: 44)
            }
            .font(.subheadline)
            .foregroundColor(.gray)

            competitorRowStats(TeamA: away, TeamB: home)

            competitorRowStats(TeamA: home, TeamB: away)
        }
        .padding(18)
        .background(Color(.systemGray6))
        .cornerRadius(14)
    }

    private func competitorRowStats(
        TeamA: GameCompetitor?,
        TeamB: GameCompetitor?
    ) -> some View {

        HStack {
            if let logo = TeamA?.team.logos.first?.href,
               let url = URL(string: logo) {
                KFImage(url)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
            } else {
                Spacer().frame(width: 30)
            }
            
            dataPointsText(
                TeamA: TeamA?.linescores?[0].displayValue,
                TeamB: TeamB?.linescores?[0].displayValue
            )

            dataPointsText(
                TeamA: TeamA?.linescores?[1].displayValue,
                TeamB: TeamB?.linescores?[1].displayValue
            )

            dataPointsText(
                TeamA: TeamA?.linescores?[2].displayValue,
                TeamB: TeamB?.linescores?[2].displayValue
            )

            dataPointsText(
                TeamA: TeamA?.linescores?[3].displayValue,
                TeamB: TeamB?.linescores?[3].displayValue
            )

            Text(TeamA?.totalScore() ?? "-")
                .font(.title3)
                .fontWeight(
                    totalPointsText(
                        TeamA: TeamA,
                        TeamB: TeamB
                    )
                )
                .frame(width: 44)
        }
    }

    private func dataPointsText(
        TeamA: String?,
        TeamB: String?
    ) -> some View {

        let ValueTeamA = Int(TeamA ?? "") ?? 0
        let ValueTeamB = Int(TeamB ?? "") ?? 0

        return Text(TeamA ?? "-")
            .font(.body)
            .fontWeight(ValueTeamA > ValueTeamB ? .semibold : .regular)
            .frame(width: 44)
    }

    private func totalPointsText(
        TeamA: GameCompetitor?,
        TeamB: GameCompetitor?
    ) -> Font.Weight {

        let TotalTeamA = Int(TeamA?.totalScore() ?? "") ?? 0
        let TotalTeamB = Int(TeamB?.totalScore() ?? "") ?? 0

        return TotalTeamA > TotalTeamB ? .semibold : .regular
    }
}

extension GameCompetition {

    static let mockWithLinescores = GameCompetition(
        status: GameStatus(type: GameStatusType(description: "Final")),
        competitors: [
            GameCompetitor(
                homeAway: "away",
                team: Team(
                    id: "26",
                    abbreviation: "SEA",
                    displayName: "Seattle Seahawks",
                    shortDisplayName: "Seahawks",
                    location: "Seattle",
                    color: "002a5c",
                    alternateColor: "69be28",
                    logos: [LogoItem(href: "https://a.espncdn.com/i/teamlogos/nfl/500/sea.png")],
                    franchise: nil,
                    record: nil,
                    standingSummary: nil
                ),
                score: nil,
                winner: true,
                linescores: [
                    GameLineScore(displayValue: "7"),
                    GameLineScore(displayValue: "10"),
                    GameLineScore(displayValue: "7"),
                    GameLineScore(displayValue: "7")
                ]
            ),
            GameCompetitor(
                homeAway: "home",
                team: Team(
                    id: "23",
                    abbreviation: "PIT",
                    displayName: "Pittsburgh Steelers",
                    shortDisplayName: "Steelers",
                    location: "Pittsburgh",
                    color: "000000",
                    alternateColor: "ffb612",
                    logos: [LogoItem(href: "https://a.espncdn.com/i/teamlogos/nfl/500/pit.png")],
                    franchise: nil,
                    record: nil,
                    standingSummary: nil
                ),
                score: nil,
                winner: false,
                linescores: [
                    GameLineScore(displayValue: "6"),
                    GameLineScore(displayValue: "8"),
                    GameLineScore(displayValue: "0"),
                    GameLineScore(displayValue: "3")
                ]
            )
        ]
    )
}

struct QuarterScoresView_Previews: PreviewProvider {
    static var previews: some View {
        QuarterScoresView(competition: .mockWithLinescores)
            .padding()
    }
}

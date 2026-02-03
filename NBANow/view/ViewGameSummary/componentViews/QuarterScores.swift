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

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
        VStack(spacing: 12) {

            HStack {
                Spacer().frame(width: 34)
                header("Q1"); header("Q2"); header("Q3"); header("Q4"); header("T")
            }

            row(team: away, opponent: home)
            row(team: home, opponent: away)
        }
    }

    private func header(_ text: String) -> some View {
        Text(text)
            .font(.caption)
            .fontWeight(.semibold)
            .foregroundColor(.secondary)
            .frame(width: 44)
    }

    private func row(team: GameCompetitor?, opponent: GameCompetitor?) -> some View {
        HStack(spacing: 0) {

            if let logo = team?.team.logos.first?.href,
               let url = URL(string: logo) {
                KFImage(url)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 26, height: 26)
                    .frame(width: 34)
            } else {
                Spacer().frame(width: 34)
            }

            cell(team, opponent, 0)
            cell(team, opponent, 1)
            cell(team, opponent, 2)
            cell(team, opponent, 3)

            Text(team?.totalScore() ?? "-")
                .font(.system(size: 18, weight: totalWeight(team, opponent)))
                .frame(width: 44)
        }
    }

    private func cell(_ team: GameCompetitor?, _ opponent: GameCompetitor?, _ index: Int) -> some View {
        let a = Int(team?.linescores?.safe(index)?.displayValue ?? "") ?? 0
        let b = Int(opponent?.linescores?.safe(index)?.displayValue ?? "") ?? 0

        return Text(team?.linescores?.safe(index)?.displayValue ?? "-")
            .font(.system(size: 16, weight: a > b ? .semibold : .regular))
            .frame(width: 44)
    }

    private func totalWeight(_ team: GameCompetitor?, _ opponent: GameCompetitor?) -> Font.Weight {
        let a = Int(team?.totalScore() ?? "") ?? 0
        let b = Int(opponent?.totalScore() ?? "") ?? 0
        return a > b ? .bold : .semibold
    }
}


extension Array {
    func safe(_ index: Int) -> Element? {
        guard indices.contains(index) else { return nil }
        return self[index]
    }
}

//
//  TeamComparisionStats.swift
//  NBANow
//
//  Created by Dean Martin Garcia on 31/1/26.
//

import SwiftUI

struct TeamComparisonStatView: View {

    let statTitle: String

    let teamAName: String
    let teamAValue: Int
    let teamAColor: String

    let teamBName: String
    let teamBValue: Int
    let teamBColor: String

    private var maxValue: Int {
        max(teamAValue, teamBValue)
    }

    private var teamAProgress: Double {
        if maxValue == 0 { return 0 }
        return Double(teamAValue) / Double(maxValue)
    }

    private var teamBProgress: Double {
        if maxValue == 0 { return 0 }
        return Double(teamBValue) / Double(maxValue)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {

            Text(statTitle.uppercased())
                .font(.headline)
                .fontWeight(.bold)

            teamRow(
                name: teamAName,
                value: teamAValue,
                progress: teamAProgress,
                color: teamAColor
            )

            teamRow(
                name: teamBName,
                value: teamBValue,
                progress: teamBProgress,
                color: teamBColor
            )
        }
        .padding(14)
        .background(Color(.systemGray6))
        .cornerRadius(14)
    }

    private func teamRow(
        name: String,
        value: Int,
        progress: Double,
        color: String
    ) -> some View {
        VStack(alignment: .leading, spacing: 6) {

            HStack {
                Text(name)
                    .font(.subheadline)
                    .fontWeight(.semibold)

                Spacer()

                Text("\(value)")
                    .font(.subheadline)
                    .fontWeight(.semibold)
            }

            progress_bar(
                progress: progress,
                color: Color(hex: color)
            )
        }
    }
}

struct TeamComparisonStatView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 16) {
            TeamComparisonStatView(
                statTitle: "Total Yards",
                teamAName: "Seahawks",
                teamAValue: 395,
                teamAColor: "002a5c",
                teamBName: "Steelers",
                teamBValue: 278,
                teamBColor: "000000"
            )

            TeamComparisonStatView(
                statTitle: "Turnovers",
                teamAName: "Seahawks",
                teamAValue: 2,
                teamAColor: "002a5c",
                teamBName: "Steelers",
                teamBValue: 1,
                teamBColor: "000000"
            )
        }
        .padding()
    }
}

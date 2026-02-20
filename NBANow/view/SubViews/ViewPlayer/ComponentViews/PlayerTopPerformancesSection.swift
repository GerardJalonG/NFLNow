//
//  PlayerTopPerformancesView.swift
//  NBANow
//
//  Created by Dean Martin Garcia on 2/2/26.
//

import SwiftUI

struct PlayerTopPerformancesSection: View {

    let topPerformances: [TopPerformanceItem]

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {

            Text("TOP PERFORMANCES")
                .font(.title3)
                .fontWeight(.bold)

            VStack(spacing: 12) {
                ForEach(topPerformances) { item in
                    VStack(alignment: .leading, spacing: 6) {

                        HStack {
                            Text(item.metric)
                                .fontWeight(.bold)

                            Spacer()

                            if let date = item.gameDate {
                                Text(dateToString(date))
                                    .foregroundColor(.gray)
                                    .font(.subheadline)
                            }
                        }

                        HStack {
                            Text(item.playerName)
                                .fontWeight(.semibold)

                            Spacer()

                            Text(item.playerValueText)
                                .foregroundColor(.gray)
                        }

                        ProgressBar(
                            progress: item.playerProgress,
                            color: Color(hex: item.playerColor)
                        )

                        HStack {
                            Text(item.opponentName)
                                .fontWeight(.semibold)

                            Spacer()

                            Text(item.opponentValueText)
                                .foregroundColor(.gray)
                        }

                        ProgressBar(
                            progress: item.opponentProgress,
                            color: Color(hex: item.opponentColor)
                        )
                    }
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                }
            }
        }
        .padding(.horizontal, 16)
    }
}

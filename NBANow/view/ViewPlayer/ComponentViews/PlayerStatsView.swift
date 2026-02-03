//
//  PlayerStatsView.swift
//  NBANow
//
//  Created by Dean Martin Garcia on 2/2/26.
//

import SwiftUI

struct PlayerStatsSection: View {

    let playerStats: [PlayerStats]

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {

            Text("STATS")
                .font(.title3)
                .fontWeight(.bold)

            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    if let s0 = playerStats[safe: 0] { stat(key: s0.key, value: s0.value) }
                    if let s1 = playerStats[safe: 1] { stat(key: s1.key, value: s1.value) }
                    if let s2 = playerStats[safe: 2] { stat(key: s2.key, value: s2.value) }
                }

                Spacer()

                VStack(alignment: .leading, spacing: 8) {
                    if let s3 = playerStats[safe: 3] { stat(key: s3.key, value: s3.value) }
                    if let s4 = playerStats[safe: 4] { stat(key: s4.key, value: s4.value) }
                    if let s5 = playerStats[safe: 5] { stat(key: s5.key, value: s5.value) }
                }
            }
        }
    }
}

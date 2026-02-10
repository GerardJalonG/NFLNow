//
//  game_stats.swift
//  NBANow
//
//  Created by Dean Martin Garcia on 30/1/26.
//


import SwiftUI
import Foundation

struct GameStatsView: View {

    let competition: GameCompetition

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {

                    GameHeaderView(competition: competition)

                    Divider()

                    QuarterScoresView(competition: competition)


                }
                .padding(.horizontal, 16)
                .padding(.top, 8)
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

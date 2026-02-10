//
//  game_stats.swift
//  NBANow
//
//  Created by Dean Martin Garcia on 30/1/26.
//

import SwiftUI
import Foundation

struct GameStatsView: View {

    let eventId: String
    @StateObject private var vm = ScoreBoardViewModel()

    private var competition: GameCompetition? {
        vm.summary?.header?.competitions.first
    }

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {

                    if let error = vm.summaryError {
                        Text(error)
                            .foregroundColor(.red)
                            .padding(.top, 40)
                            .frame(maxWidth: .infinity)

                    } else if let competition {
                        GameHeaderView(competition: competition)

                        Divider()

                        QuarterScoresView(competition: competition)

                    } else {
                        VStack(spacing: 10) {
                            ProgressView()
                            Text("Cargando resumen del partido…")
                                .foregroundColor(.secondary)
                        }
                        .padding(.top, 40)
                        .frame(maxWidth: .infinity)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.top, 8)
            }
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                if vm.summary == nil && vm.summaryError == nil {
                    vm.fetchSummary(eventId: eventId)
                }
            }
        }
    }
}

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
                        
                        if let teams = vm.summary?.boxscore?.teams {
                            Divider()

                            VStack(spacing: 10) {
                                ForEach(top5StatNames, id: \.self) { statName in
                                    StatRowView(
                                        statAbbr: statAbbr(statName),
                                        teamAValue: statValue(teams: teams, homeAway: "away", statName: statName),
                                        teamBValue: statValue(teams: teams, homeAway: "home", statName: statName)
                                    )

                                    Divider()
                                }
                            }
                            .padding(18)
                            .background(Color(.systemGray6))
                            .cornerRadius(14)
                        } else {
                            VStack(spacing: 10) {
                                ProgressView()
                                Text("Cargando stats del partido…")
                                    .foregroundColor(.secondary)
                            }
                            .padding(.top, 40)
                            .frame(maxWidth: .infinity)
                        }
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

private let top5StatNames: [String] = [
    "totalDrives",
    "totalOffensivePlays",
    "rushingYards",
    "interceptions",
    "possessionTime"
]

private func statValue(
    teams: [BoxscoreTeam],
    homeAway: String,
    statName: String
) -> String? {
    let team = teams.first(where: { $0.homeAway == homeAway })
    return team?.statistics.first(where: { $0.name == statName })?.displayValue
}

private func statLabel(
    teams: [BoxscoreTeam],
    statName: String
) -> String {
    let any = teams.first?.statistics.first(where: { $0.name == statName })?.label
    return any ?? statName
}

private func statAbbr(_ statName: String) -> String {
    switch statName {
    case "totalDrives": return "DRIVES"
    case "totalOffensivePlays": return "PLAYS"
    case "rushingYards": return "RUSH YDS"
    case "interceptions": return "INT"
    case "possessionTime": return "TOP"
    default: return statName.uppercased()
    }
}

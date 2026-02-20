//
//  player_info.swift
//  NBANow
//
//  Created by Dean Martin Garcia on 27/1/26.
//
import SwiftUI
import KingfisherSwiftUI

struct PlayerInfo: View {

    let player: CreatedPlayer

    private var playerStats: [PlayerStats] {
        PlayerPositions.PlayerDefaultStats(player: player).stats
    }

    private var topPerformances: [TopPerformanceItem] {
        TopPerformancesStats(player: player).items
    }

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: UI.Sizes.extraLarge) {

                    PlayerHeaderSection(player: player).padding(.horizontal, UI.Sizes.extraLarge)

                    Divider()

                    PlayerStatsSection(playerStats: playerStats).padding(.horizontal, UI.Sizes.extraLarge)

                    Divider()
                        .padding(.vertical, UI.Sizes.regular)

                    PlayerTopPerformancesSection(topPerformances: topPerformances)
                }
                .padding(.horizontal, UI.Sizes.extraLarge)
                .padding(.top, UI.Sizes.medium)
                
            }
        }
    }
}

extension Athlete {
    static let mock = Athlete(
        id: "4373626",
        fullName: "Tyler Allgeier",
        age: 24,
        jersey: "25",
        position: Position(abbreviation: "RB", displayName: "Running Back"),
        headshot: Headshot(href: "https://a.espncdn.com/i/headshots/nfl/players/full/4373626.png")
    )
}


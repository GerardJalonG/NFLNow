//
//  player_info.swift
//  NBANow
//
//  Created by Dean Martin Garcia on 27/1/26.
//
import SwiftUI
import KingfisherSwiftUI

struct player_info: View {

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
                VStack(alignment: .leading, spacing: 16) {

                    PlayerHeaderView(player: player).padding(.horizontal, 16)

                    Divider()

                    PlayerStatsSection(playerStats: playerStats).padding(.horizontal, 16)

                    Divider()
                        .padding(.vertical, 6)

                    PlayerTopPerformancesView(topPerformances: topPerformances)
                }
                .padding(.horizontal, 16)
                .padding(.top, 8)
                
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

struct player_info_Previews: PreviewProvider {
    static var previews: some View {
        player_info(
            player: .mock
        )
    }
}

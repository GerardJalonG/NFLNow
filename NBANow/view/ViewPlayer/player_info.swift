//
//  player_info.swift
//  NBANow
//
//  Created by Dean Martin Garcia on 27/1/26.
//
import SwiftUI
import KingfisherSwiftUI

struct player_info: View {

    let player: Athlete

    private var playerStats: [PlayerStats] {
        PlayerDefaultStats(player: player).stats
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
        shortName: "T. Allgeier",
        displayWeight: "225 lbs",
        displayHeight: "5' 10\"",
        age: 25,
        birthPlace: BirthPlace(
            city: "Fontana",
            state: "CA",
            country: "USA"
        ),
        college: College(
            id: "252",
            name: "BYU",
            mascot: "Cougars",
            logos: [
                Logo(
                    href: "https://a.espncdn.com/i/playerlogos/ncaa/500/252.png",
                    width: 500,
                    height: 500
                ),
                Logo(
                    href: "https://a.espncdn.com/i/playerlogos/ncaa/500-dark/252.png",
                    width: 500,
                    height: 500
                )
            ]
        ),
        jersey: "25",
        position: Position(
            id: "9",
            displayName: "Running Back",
            abbreviation: "RB",
            parent: ParentPosition(
                id: "70",
                displayName: "Offense"
            )
        ),
        experience: YearsActive(years: 4)
    )
}

struct player_info_Previews: PreviewProvider {
    static var previews: some View {
        player_info(
            player: .mock
        )
    }
}

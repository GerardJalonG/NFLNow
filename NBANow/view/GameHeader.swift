//
//  GameHeader.swift
//  NBANow
//
//  Created by Dean Martin Garcia on 30/1/26.
//

import SwiftUI
import Foundation
import KingfisherSwiftUI

struct GameHeaderView: View {

    let competition: GameCompetition

    private var home: GameCompetitor? {
        competition.competitors.first(where: { $0.homeAway == "home" })
    }

    private var away: GameCompetitor? {
        competition.competitors.first(where: { $0.homeAway == "away" })
    }

    var body: some View {

        HStack(alignment: .center, spacing: 16) {
            VStack(spacing: 6) {
                if let logoURL = away?.team.logos.first?.href,
                   let url = URL(string: logoURL) {
                    KFImage(url)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)
                }

                Text(away?.team.displayName ?? "-")
                    .font(.caption)
                    .fontWeight(.semibold)

                Text(away?.score ?? "-")
                    .font(.title3)
                    .fontWeight((away?.winner ?? false) ? .semibold : .regular)
            }

            VStack(spacing: 6) {
                Text((competition.status.type.description).uppercased())
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
            }.padding(24)

            VStack(spacing: 6) {

                if let logoURL = home?.team.logos.first?.href,
                   let url = URL(string: logoURL) {
                    KFImage(url)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)
                }

                Text(home?.team.displayName ?? "-")
                    .font(.caption)
                    .fontWeight(.semibold)

                Text(home?.score ?? "-")
                    .font(.title3)
                    .fontWeight((home?.winner ?? false) ? .semibold : .regular)
            }
        }
        .padding(12)
    }
}

extension GameCompetition {

    static let mock = GameCompetition(
        status: GameStatus(
            type: GameStatusType(
                description: "Final"
            )
        ),
        competitors: [
            GameCompetitor(
                homeAway: "away",
                team: Team(
                    id: "26",
                    abbreviation: "SEA",
                    displayName: "Seattle Seahawks",
                    shortDisplayName: "Seahawks",
                    location: "Seattle",
                    color: "002a5c",
                    alternateColor: "69be28",
                    logos: [
                        LogoItem(
                            href: "https://a.espncdn.com/i/teamlogos/nfl/500/sea.png"
                        )
                    ],
                    franchise: nil,
                    record: nil,
                    standingSummary: nil
                ),
                score: "31",
                winner: true
            ),
            GameCompetitor(
                homeAway: "home",
                team: Team(
                    id: "23",
                    abbreviation: "PIT",
                    displayName: "Pittsburgh Steelers",
                    shortDisplayName: "Steelers",
                    location: "Pittsburgh",
                    color: "000000",
                    alternateColor: "ffb612",
                    logos: [
                        LogoItem(
                            href: "https://a.espncdn.com/i/teamlogos/nfl/500/pit.png"
                        )
                    ],
                    franchise: nil,
                    record: nil,
                    standingSummary: nil
                ),
                score: "17",
                winner: false
            )
        ]
    )
}

struct GameHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        GameHeaderView(competition: .mock)
            .padding()
    }
}

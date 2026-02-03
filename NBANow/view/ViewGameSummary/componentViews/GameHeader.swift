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

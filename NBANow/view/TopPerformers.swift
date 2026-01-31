//
//  TopPerformers.swift
//  NBANow
//
//  Created by Dean Martin Garcia on 31/1/26.
//

import SwiftUI
import KingfisherSwiftUI

struct TopPerformerRowView: View {

    // Player info
    let playerName: String
    let teamAbbreviation: String
    let jerseyNumber: String
    let position: String
    let playerImageURL: String?

    // Stat info
    let statValue: String
    let statLabel: String

    var body: some View {
        HStack(spacing: 14) {

            // PLAYER IMAGE
            if let imageURL = playerImageURL,
               let url = URL(string: imageURL) {
                KFImage(url)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 44, height: 44)
                    .clipShape(Circle())
            } else {
                Circle()
                    .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                    .frame(width: 44, height: 44)
            }

            // NAME + TEAM INFO
            VStack(alignment: .leading, spacing: 4) {

                Text(playerName)
                    .font(.headline)
                    .fontWeight(.semibold)

                HStack(spacing: 8) {
                    Text(teamAbbreviation)
                    Text("#\(jerseyNumber)")
                    Text(position)
                }
                .font(.subheadline)
                .foregroundColor(.gray)
            }

            Spacer(minLength: 8)

            // STAT
            VStack(spacing: 2) {
                Text(statValue)
                    .font(.title3)
                    .fontWeight(.semibold)

                Text(statLabel)
                    .font(.caption)
                    .foregroundColor(.gray)
            }.padding(.trailing, 14)
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 10)
        .frame(maxWidth: 320)          // ⬅️ clave para que no sea tan larga
        .background(Color(.systemGray6))
        .cornerRadius(14)
    }
}

struct TopPerformerRowView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            TopPerformerRowView(
                playerName: "Steve Adams",
                teamAbbreviation: "HOU",
                jerseyNumber: "12",
                position: "C",
                playerImageURL: "https://a.espncdn.com/i/headshots/nba/players/full/4265.png",
                statValue: "11",
                statLabel: "PTS"
            )
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}

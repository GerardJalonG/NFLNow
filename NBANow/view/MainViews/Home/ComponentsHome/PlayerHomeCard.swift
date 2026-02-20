//
//  PlayerCard.swift
//  NBANow
//
//  Created by Dean Martin Garcia on 3/2/26.
//

import SwiftUI

struct PlayerHomeCard: View {

    let player: CreatedPlayer

    var body: some View {
        NavigationLink(destination: PlayerInfo(player: player)) {

            VStack(spacing: 0) {

                Text(player.avatar.rawValue)
                    .font(.system(size: 56))
                    .frame(height: 120)
                    .frame(maxWidth: .infinity)
                    .background(Color(.systemGray5))

                HStack {
                    Text(player.name)
                        .font(.headline)
                        .foregroundColor(.primary)
                        .lineLimit(1)

                    Spacer()

                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                }
                .padding()
            }
            .background(Color(.systemBackground))
            .cornerRadius(14)
            .shadow(color: Color.black.opacity(0.15),
                    radius: 6,
                    x: 0,
                    y: 3)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

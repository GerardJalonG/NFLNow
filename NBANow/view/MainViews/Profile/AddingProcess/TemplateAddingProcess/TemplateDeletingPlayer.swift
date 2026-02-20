//
//  PlayerRowView.swift
//  NBANow
//
//  Created by Dean Martin Garcia on 3/2/26.
//

import SwiftUI

struct TemplateDeletingPlayers: View {

    let player: CreatedPlayer
    let eliminar: () -> Void

    var body: some View {
        HStack(spacing: 12) {

            ZStack {
                Circle()
                    .fill(Color.gray.opacity(0.2))

                Text(player.avatar.rawValue)
                    .font(.title2)
            }
            .frame(width: 40, height: 40)

            VStack(alignment: .leading, spacing: 2) {
                Text(player.name)
                    .font(.body)
                    .fontWeight(.semibold)

                Text("#\(player.jerseyNumber)  \(player.position.rawValue)")
                    .font(.caption)
                    .foregroundColor(.gray)
            }

            Spacer()

            Button(action: {
                eliminar()
            }) {
                Image(systemName: "minus.circle.fill")
                    .font(.system(size: 22))
                    .foregroundColor(.red)
            }
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 16)
    }
}

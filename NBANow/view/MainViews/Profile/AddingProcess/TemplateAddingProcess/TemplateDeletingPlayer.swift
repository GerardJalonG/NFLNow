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
        HStack(spacing: UI.Sizes.large) {

            ZStack {
                Circle()
                    .fill(Color.gray.opacity(0.2))

                Text(player.avatar.rawValue)
                    .font(.title2)
            }
            .frame(width: UI.Sizes.screen, height: UI.Sizes.screen)

            VStack(alignment: .leading, spacing: UI.Sizes.tiny) {
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
        .padding(.horizontal, UI.Sizes.extraLarge)
    }
}

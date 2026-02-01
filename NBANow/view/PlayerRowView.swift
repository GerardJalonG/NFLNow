//
//  PlayerRowView.swift
//  NBANow
//
//  Created by Dean Martin Garcia on 31/1/26.
//

import SwiftUI
import KingfisherSwiftUI

struct PlayerRowView: View {
    let player: PlayerListItem
    let isFollowing: Bool
    let anadir: () -> Void
    let eliminar: () -> Void

    var body: some View {
        HStack(spacing: 12) {

            if let imageURL = player.headshotURL,
               let url = URL(string: imageURL) {
                KFImage(url)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
            } else {
                Circle()
                    .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                    .frame(width: 40, height: 40)
            }

            VStack(alignment: .leading, spacing: 4) {

                Text(player.name)
                    .font(.body)
                    .fontWeight(.semibold)

                Text("\(player.teamAbbreviation)  #\(player.jersey)  \(player.position)")
                    .font(.caption)
                    .foregroundColor(.gray)
            }

            Spacer()

            Button(action: {
                if isFollowing {
                    eliminar()
                } else {
                    anadir()
                }
            }) {
                Image(systemName: isFollowing ? "minus.circle.fill" : "plus.circle.fill")
                    .font(.system(size: 22))
                    .foregroundColor(isFollowing ? .red : .blue)
            }
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 16)
    }
}

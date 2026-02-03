//
//  PlayerHeaderView.swift
//  NBANow
//
//  Created by Dean Martin Garcia on 2/2/26.
//

import SwiftUI
struct PlayerHeaderView: View {

    let player: Athlete

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {

            Text("Age: \(player.age)")
                .font(.caption)
                .foregroundColor(.gray)

            Text("#\(player.jersey ?? "-")  \(player.position.abbreviation)")
                            .font(.caption)
                            .foregroundColor(.gray)

            Text(player.fullName)
                .font(.title)
                .fontWeight(.bold)
        }
    }
}

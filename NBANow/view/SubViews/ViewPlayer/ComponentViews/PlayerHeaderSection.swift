//
//  PlayerHeaderView.swift
//  NBANow
//
//  Created by Dean Martin Garcia on 2/2/26.
//

import SwiftUI
struct PlayerHeaderSection: View {

    let player: CreatedPlayer

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {

            Text("Age: \(player.age)")
                .foregroundColor(.gray)

            Text("#\(player.jerseyNumber )  \(player.position.displayName)")
                .foregroundColor(.gray)

            Text(player.name)
                .font(.title)
                .fontWeight(.bold)
        }
    }
}

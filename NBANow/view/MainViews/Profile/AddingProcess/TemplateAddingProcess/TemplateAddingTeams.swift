//
//  TeamRowView.swift
//  NBANow
//
//  Created by Dean Martin Garcia on 1/2/26.
//

import SwiftUI
import KingfisherSwiftUI

struct TemplateAddingTeams: View {

    let team: Team
    let isFollowing: Bool
    let anadir: () -> Void
    let eliminar: () -> Void

    var body: some View {
        HStack(spacing: UI.Sizes.large) {
            if let logoURL = team.logos.first?.href,
               let url = URL(string: logoURL) {
                KFImage(url)
                    .resizable()
                    .scaledToFit()
                    .frame(width: UI.Sizes.screen, height: UI.Sizes.screen)
            } else {
                Rectangle()
                    .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                    .frame(width: UI.Sizes.screen, height: UI.Sizes.screen)
            }

            Text(team.displayName)
                .font(.body)
                .fontWeight(.semibold)

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
        .padding(.horizontal, UI.Sizes.extraLarge)
    }
}

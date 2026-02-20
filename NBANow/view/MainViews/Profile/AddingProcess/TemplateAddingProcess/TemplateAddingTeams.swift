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
        HStack(spacing: 12) {
            if let logoURL = team.logos.first?.href,
               let url = URL(string: logoURL) {
                KFImage(url)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
            } else {
                Rectangle()
                    .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                    .frame(width: 40, height: 40)
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
        .padding(.horizontal, 16)
    }
}

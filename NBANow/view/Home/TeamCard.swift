//
//  TeamCard.swift
//  NBANow
//
//  Created by Dean Martin Garcia on 3/2/26.
//

import SwiftUI
import KingfisherSwiftUI

struct TeamHomeCard: View {

    let team: Team

    var body: some View {
        NavigationLink(destination: team_info(team: team)) {

            VStack(spacing: 0) {

                if let logoURL = team.logos.first?.href,
                   let url = URL(string: logoURL) {

                    KFImage(url)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 120)
                        .frame(maxWidth: .infinity)
                        .background(Color(.gray))
                }

                HStack {
                    Text(team.displayName)
                        .font(.headline)
                        .foregroundColor(.primary)

                    Spacer()

                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                }
                .padding()
            }
            .background(Color(.systemBackground))
            .cornerRadius(14)
            .shadow(color: Color.black.opacity(0.15), radius: 6, x: 0, y: 3)
        }
    }
}

struct TeamHomeCard_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TeamHomeCard(team: .mock)
                .padding()
        }
    }
}

import SwiftUI
import Foundation
import KingfisherSwiftUI

struct GameHeaderView: View {

    let competition: GameCompetition

    private var home: GameCompetitor? {
        competition.competitors.first(where: { $0.homeAway == "home" })
    }

    private var away: GameCompetitor? {
        competition.competitors.first(where: { $0.homeAway == "away" })
    }

    var body: some View {
        HStack(alignment: .center, spacing: 18) {

            VStack(spacing: 8) {
                if let logoURL = away?.team.logos.first?.href,
                   let url = URL(string: logoURL) {
                    KFImage(url)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 54, height: 54)
                }

                Text(away?.team.displayName ?? "-")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .minimumScaleFactor(0.85)

                Text(away?.score ?? "-")
                    .font(.system(size: 30, weight: (away?.winner ?? false) ? .bold : .semibold))
                    .foregroundColor((away?.winner ?? false) ? .primary : .secondary)
            }
            .frame(maxWidth: .infinity)

            Text((competition.status.type.description).uppercased())
                .font(.footnote)
                .fontWeight(.bold)
                .foregroundColor(.secondary)
                .frame(minWidth: 80)

            VStack(spacing: 8) {
                if let logoURL = home?.team.logos.first?.href,
                   let url = URL(string: logoURL) {
                    KFImage(url)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 54, height: 54)
                }

                Text(home?.team.displayName ?? "-")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .minimumScaleFactor(0.85)

                Text(home?.score ?? "-")
                    .font(.system(size: 30, weight: (home?.winner ?? false) ? .bold : .semibold))
                    .foregroundColor((home?.winner ?? false) ? .primary : .secondary)
            }
            .frame(maxWidth: .infinity)
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 6)
    }
}

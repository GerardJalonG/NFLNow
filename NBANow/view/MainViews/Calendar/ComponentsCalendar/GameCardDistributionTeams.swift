import SwiftUI
import KingfisherSwiftUI

struct GameCardInfo: View {
    let logo: String?
    let abbr: String
    let score: String
    let winner: Bool

    var body: some View {
        HStack(spacing: 14) {

            if let logo = logo, let url = URL(string: logo) {
                KFImage(url)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
            } else {
                Circle()
                    .fill(Color.gray.opacity(0.15))
                    .frame(width: UI.Sizes.screen, height: UI.Sizes.screen)
            }

            VStack(alignment: .leading, spacing: UI.Sizes.small) {
                Text(abbr)
                    .font(.system(size: 18, weight: winner ? .bold : .semibold))
                    .foregroundColor(winner ? .primary : .secondary)

                Text(score)
                    .font(.system(size: 34, weight: winner ? .bold : .semibold))
                    .foregroundColor(winner ? .primary : .secondary)
                    .lineLimit(1)
                    .minimumScaleFactor(0.8)
            }
        }
    }
}

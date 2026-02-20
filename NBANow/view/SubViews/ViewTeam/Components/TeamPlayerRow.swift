import SwiftUI
import KingfisherSwiftUI

struct TeamPlayerRow: View {
    let player: Athlete

    var body: some View {
        HStack(spacing: UI.Sizes.large) {

            if let imageURL = player.headshot?.href,
               let url = URL(string: imageURL) {
                KFImage(url)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UI.Sizes.screen, height: UI.Sizes.screen)
                    .clipShape(Circle())
            } else {
                Circle()
                    .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                    .frame(width: UI.Sizes.screen, height: UI.Sizes.screen)
            }

            VStack(alignment: .leading, spacing: 4) {

                Text(player.fullName)
                    .font(.body)
                    .fontWeight(.semibold)

                Text("\(player.position.abbreviation)  #\(player.jersey ?? "-")  \(player.age)")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .padding(.vertical, 10)
        .padding(.horizontal, UI.Sizes.extraLarge)
    }
}

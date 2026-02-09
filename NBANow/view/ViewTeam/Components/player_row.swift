import SwiftUI
import KingfisherSwiftUI

struct PlayerRow: View {
    let player: Athlete

    var body: some View {
        HStack(spacing: 12) {

            if let imageURL = player.headshot?.href,
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

                Text(player.fullName)
                    .font(.body)
                    .fontWeight(.semibold)

                Text("\(player.position.abbreviation)  #\(player.jersey ?? "-")  \(player.age)")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 16)
    }
}

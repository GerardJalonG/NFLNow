import SwiftUI
import KingfisherSwiftUI

struct TeamSide: View {
    let logo: String?
    let abbr: String
    let score: String
    let winner: Bool

    var body: some View {
        HStack(spacing: 12) {
            if let logo, let url = URL(string: logo) {
                KFImage(url)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 44, height: 44)
                    .cornerRadius(8)
            }

            VStack(alignment: .leading, spacing: 2) {
                Text(abbr)
                    .font(.title3)
                    .fontWeight(.semibold)

                Text(score)
                    .font(.title)
                    .fontWeight(winner ? .bold : .semibold)
            }
        }
    }
}

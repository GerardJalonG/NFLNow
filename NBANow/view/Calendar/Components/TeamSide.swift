import SwiftUI
import KingfisherSwiftUI

struct TeamSide: View {
    let logo: String?
    let abbr: String
    let score: String
    let winner: Bool

    var body: some View {
        HStack(spacing: 8) {
            if let logo, let url = URL(string: logo) {
                KFImage(url)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 28, height: 28)
            }

            VStack(alignment: .leading, spacing: 2) {
                Text(abbr).font(.headline)
                Text(score).font(.headline).fontWeight(winner ? .bold : .regular)
            }
        }
    }
}

import SwiftUI
import KingfisherSwiftUI

struct GameHomeCard: View {

    let game: Event
    let weekNumber: Int

    var body: some View {
        let competition = game.competitions?.first
        let home = competition?.competitors?.first(where: { $0.homeAway == "home" })
        let away = competition?.competitors?.first(where: { $0.homeAway == "away" })
        let statusText = competition?.status?.type?.description ?? game.status?.type?.description ?? ""

        VStack(spacing: 0) {

            HStack {
                Text("Week \(weekNumber)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                Spacer()

                Text(statusText)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            .padding()

            Divider()

            HStack(spacing: 20) {
                TeamSide(
                    logo: away?.team?.logo,
                    abbr: away?.team?.abbreviation ?? "--",
                    score: away?.score ?? "-",
                    winner: away?.winner ?? false
                )

                Text("vs").foregroundColor(.gray)

                TeamSide(
                    logo: home?.team?.logo,
                    abbr: home?.team?.abbreviation ?? "--",
                    score: home?.score ?? "-",
                    winner: home?.winner ?? false
                )

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

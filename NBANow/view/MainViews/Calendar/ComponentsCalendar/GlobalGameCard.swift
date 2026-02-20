import SwiftUI
import KingfisherSwiftUI

struct GlobalGameCard: View {

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
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)

            Divider()

            HStack {

                GameCardInfo(
                    logo: away?.team?.logo,
                    abbr: away?.team?.abbreviation ?? "--",
                    score: away?.score ?? "-",
                    winner: away?.winner ?? false
                )

                Spacer()

                Text("vs")
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                Spacer()

                GameCardInfo(
                    logo: home?.team?.logo,
                    abbr: home?.team?.abbreviation ?? "--",
                    score: home?.score ?? "-",
                    winner: home?.winner ?? false
                )

                Spacer()

                Image(systemName: "chevron.right")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.secondary)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 18)
        }
        .background(Color(.systemBackground))
        .cornerRadius(18)
        .shadow(color: Color.black.opacity(0.08), radius: 12, x: 0, y: 6)
    }
}

import SwiftUI
import KingfisherSwiftUI

struct GameHomeCard: View {

    let game: EventsGames
    let weekNumber: Int

    var body: some View {
        let competition = game.competitions.first
        let home = competition?.competitors.first(where: { $0.homeAway == "home" })
        let away = competition?.competitors.first(where: { $0.homeAway == "away" })
        let statusText = competition?.status.type.description ?? ""

            VStack(spacing: 0) {

                HStack {
                    Text("Week \(weekNumber)")
                        .font(.headline)
                        .foregroundColor(.primary)

                    Spacer()

                    Text(statusText)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding()

                Divider()

                HStack(spacing: 16) {
                    TeamSide(
                        logo: away?.team.logo,
                        abbr: away?.team.abbreviation ?? "--",
                        score: away?.score ?? "-",
                        winner: away?.winner ?? false
                    )

                    Text("vs").foregroundColor(.gray)

                    TeamSide(
                        logo: home?.team.logo,
                        abbr: home?.team.abbreviation ?? "--",
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

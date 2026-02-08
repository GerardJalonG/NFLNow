import SwiftUI
import KingfisherSwiftUI

struct team_info: View {
    let team: Team

    @StateObject private var vm = TeamDetailViewModel()

    private var t: Team { vm.team ?? team }

    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomLeading) {
                Color(hex: t.color)

                VStack(alignment: .leading, spacing: 8) {
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 4) {

                            HStack(spacing: 6) {
                                Text(t.standingSummary ?? "No hay posición definida.")
                                    .font(.body)
                                    .fontWeight(.medium)

                                Text(t.record?.items.first?.summary ?? "No hay record registrado.")
                                    .font(.headline)
                                    .fontWeight(.medium)
                            }

                            Text(t.franchise?.venue.fullName ?? "No hay campo definido.")
                                .font(.title3)
                                .fontWeight(.semibold)
                        }

                        Spacer()

                        if let logoURL = t.logos.first?.href,
                           let url = URL(string: logoURL) {
                            KFImage(url)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                        }
                    }

                    Text(t.displayName)
                        .font(.title)
                        .fontWeight(.black)
                }
                .padding(.horizontal)
                .padding(.bottom)
                .padding(.top, 40)                 .foregroundColor(.white)
            }
            .frame(minHeight: 220)

            Divider()

            VStack(alignment: .leading, spacing: 10) {
                Text("STATS").bold()

                if t.record?.items.first?.stats.isEmpty == false {
                    HStack {
                        VStack(spacing: 8) {
                            stat(key: "APA", value: decimal_to_string(t.record?.items.first?.stats[safe: 2]?.value))
                            stat(key: "APF", value: decimal_to_string(t.record?.items.first?.stats[safe: 3]?.value))
                            stat(key: "WP%", value: decimal_to_string(t.record?.items.first?.stats[safe: 18]?.value))
                        }

                        Spacer()

                        VStack(spacing: 8) {
                            stat(key: "PAG", value: decimal_to_string(t.record?.items.first?.stats[safe: 14]?.value))
                            stat(key: "PDF", value: decimal_to_string(t.record?.items.first?.stats[safe: 12]?.value))
                            stat(key: "PFO", value: decimal_to_string(t.record?.items.first?.stats[safe: 15]?.value))
                        }
                    }
                } else {
                    Text(vm.messageError ?? "Cargando estadísticas…")
                        .foregroundColor(.secondary)
                }
            }
            .padding(.vertical, 8)
            .padding(.horizontal)
        }
        .edgesIgnoringSafeArea(.top)
        .onAppear {
            if vm.team == nil {
                vm.fetchTeam(id: team.id)
            }
        }
    }
}

struct team_info_Previews: PreviewProvider {
    static var previews: some View {
        team_info(team: .mock)
    }
}

extension Team {
    static let mock = Team(
        id: "1",
        abbreviation: "NE",
        displayName: "New England Patriots",
        shortDisplayName: "Patriots",
        location: "New England",
        color: "206030",
        alternateColor: "C60C30",
        logos: [
            LogoItem(href: "https://a.espncdn.com/i/teamlogos/nfl/500/atl.png")
        ],
        franchise: Franchise(
            id: "100",
            fullName: "New England Patriots Franchise",
            venue: Venue(
                fullName: "Gillette Stadium",
                address: Address(city: "Foxborough", state: "MA")
            )
        ),
        record: Record(
            items: [
                RecordItem(
                    type: "total",
                    summary: "12-5",
                    stats: [
                        RecordStat(name: "wins", value: 12),
                        RecordStat(name: "losses", value: 5),

                        // relleno para que tus índices [safe: 2], [3], [12], [14], [15], [18] existan
                        RecordStat(name: "s2", value: 101),
                        RecordStat(name: "s3", value: 102),
                        RecordStat(name: "s4", value: 0),
                        RecordStat(name: "s5", value: 0),
                        RecordStat(name: "s6", value: 0),
                        RecordStat(name: "s7", value: 0),
                        RecordStat(name: "s8", value: 0),
                        RecordStat(name: "s9", value: 0),
                        RecordStat(name: "s10", value: 0),
                        RecordStat(name: "s11", value: 0),
                        RecordStat(name: "s12", value: 110),
                        RecordStat(name: "s13", value: 0),
                        RecordStat(name: "s14", value: 120),
                        RecordStat(name: "s15", value: 130),
                        RecordStat(name: "s16", value: 0),
                        RecordStat(name: "s17", value: 0),
                        RecordStat(name: "s18", value: 0.705)
                    ]
                )
            ]
        ),
        standingSummary: "1st in AFC East"
    )
}

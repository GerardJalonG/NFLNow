import SwiftUI
import KingfisherSwiftUI

struct team_info: View {
    let team: Team

    @State private var pag = Double.random(in: 40...250)
    @State private var pfo = Double.random(in: 40...200)
    private var pdf: Double { pag - pfo }
    
    @StateObject private var vm = TeamDetailViewModel()
    @StateObject private var rvm = RosterViewModel()

    private var t: Team { vm.team ?? team }
    
    private var stats: [RecordStat]? { t.record?.items?.first?.stats }
    private var apa: Double? { stats?[safe: 2]?.value }
    private var apf: Double? { stats?[safe: 3]?.value }
    private var wp:  Double? { stats?[safe: 9]?.value }

    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomLeading) {
                Color(hex: t.color)

                VStack(alignment: .leading, spacing: 8) {
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 4) {

                            HStack(spacing: 6) {
                                Text(t.standingSummary ?? "There is no position registered.")
                                    .font(.body)
                                    .fontWeight(.medium)

                                Text(t.record?.items?.first?.summary ?? "There is no record.")
                                    .font(.headline)
                                    .fontWeight(.medium)
                            }

                            Text(t.franchise?.venue.fullName ?? "There is no venue.")
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
                .padding(.top, 40)                 
                .foregroundColor(.white)
            }
            .frame(minHeight: 220)

            Divider()

            VStack(alignment: .leading, spacing: 10) {
                Text("STATS").bold()
                if t.record?.items?.first?.stats?.isEmpty == false {
                    HStack {
                        VStack(spacing: 8) {
                            stat(key: "APA", value: decimal_to_string(apa))
                            stat(key: "APF", value: decimal_to_string(apf))
                            stat(key: "WP%", value: decimal_to_string(wp))
                        }

                        Spacer()

                        VStack(spacing: 8) {
                            stat(key: "PAG", value: decimal_to_string(pag))
                            stat(key: "PDF", value: decimal_to_string(pdf))
                            stat(key: "PFO", value: decimal_to_string(pfo))
                        }
                    }
                } else {
                    Text(vm.messageError ?? "Loading stats...")
                        .foregroundColor(.secondary)
                }
                
                if let roster = rvm.roster {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("ROSTER").bold()

                        ForEach(roster.athletes, id: \.position) { group in
                            Text(group.position.uppercased())
                                .font(.headline)
                                .padding(.top, 8)

                            ForEach(group.items) { player in
                                PlayerRow(player: player)
                            }
                        }
                    }
                } else {
                    Text(rvm.messageError ?? "Loading roster...")
                        .foregroundColor(.secondary)
                }
            }
            .padding(.vertical, 8)
            .padding(.horizontal)
        }
        .edgesIgnoringSafeArea(.top)
        .onAppear {
            vm.fetchTeam(id: team.id)
            rvm.fetchRoster(teamId: team.id)
        }
    }
}



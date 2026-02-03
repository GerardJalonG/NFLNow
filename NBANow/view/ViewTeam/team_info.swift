import SwiftUI
import KingfisherSwiftUI

struct team_info: View {
    let team:Team
    var body: some View {
        NavigationView {
            ScrollView{
                ZStack(alignment: .bottomLeading) {
                    Color(hex: team.color)
                    VStack(alignment: .leading, spacing: 8) {
                        HStack(alignment: .top) {
                            VStack(alignment: .leading, spacing: 4) {

                                HStack(spacing: 6) {
                                    Text(team.standingSummary ?? "No hay posición definida.")
                                        .font(.body)
                                        .fontWeight(.medium)

                                    Text(team.record?.items.first?.summary ?? "No hay record registrado.")
                                        .font(.headline)
                                        .fontWeight(.medium)
                                }

                                Text(team.franchise?.venue.fullName ?? "No hay campo definido.")
                                    .font(.title3)
                                    .fontWeight(.semibold)
                            }

                            Spacer()
                            if let logoURL = team.logos.first?.href,
                               let url = URL(string: logoURL) {

                                KFImage(url)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 60, height: 60)
                            }
                        }
                        Text(team.displayName)
                            .font(.title)
                            .fontWeight(.black)
                    }
                    .padding()
                    .foregroundColor(.white)
                }
                .frame(minHeight: 150)
                
                Divider()
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("STATS").bold()
                    
                    HStack {
                        VStack (spacing: 8){
                            stat(key: "APA", value: decimal_to_string(team.record?.items.first?.stats[safe: 2]?.value))
                            stat(key: "APF", value: decimal_to_string(team.record?.items.first?.stats[safe: 3]?.value))
                            
                            stat(key: "WP%", value: decimal_to_string(team.record?.items.first?.stats[safe: 18]?.value))
                            
                        }
                        Spacer()
                        VStack (spacing: 8) {
                            stat(
                                key: "PAG",
                                value: decimal_to_string(
                                    team.record?.items.first?.stats[safe: 14]?.value
                                )
                            )
                            stat(key: "PDF", value: decimal_to_string(team.record?.items.first?.stats[safe: 12]?.value))
                            
                            stat(key: "PFO", value: decimal_to_string(team.record?.items.first?.stats[safe: 15]?.value))
                        }
                    }
                    
                }.padding(.vertical, 8)
                .padding(.horizontal)
                
                
                
                
                
                
                
                
            }.edgesIgnoringSafeArea(.top)
            //.navigationTitle(team.displayName)
            //.navigationBarTitleDisplayMode(.inline)
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
                    LogoItem(
                        href: "https://a.espncdn.com/i/teamlogos/nfl/500/atl.png"
                    )
                ],
        franchise: Franchise(
            id: "100",
            fullName: "New England Patriots Franchise",
            venue: Venue(
                fullName: "Gillette Stadium",
                address: Address(
                    city: "Foxborough",
                    state: "MA"
                )
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
                        
                        RecordStat(name: "losses", value: 5),
                        
                        RecordStat(name: "losses", value: 5),
                        
                        RecordStat(name: "losses", value: 5),
                        
                        RecordStat(name: "losses", value: 5),
                        
                        RecordStat(name: "losses", value: 5),
                        
                        RecordStat(name: "losses", value: 5),
                        RecordStat(name: "losses", value: 5),
                        RecordStat(name: "losses", value: 5),
                        RecordStat(name: "losses", value: 5),
                        RecordStat(name: "losses", value: 5),
                        RecordStat(name: "losses", value: 5),
                        RecordStat(name: "losses", value: 5),
                        RecordStat(name: "losses", value: 5),
                        RecordStat(name: "losses", value: 5),
                        RecordStat(name: "losses", value: 5),
                        RecordStat(name: "losses", value: 5),
                        RecordStat(name: "losses", value: 5),
                        RecordStat(name: "losses", value: 5),
                        RecordStat(name: "losses", value: 5),
                        RecordStat(name: "losses", value: 5)
                    ]
                )
            ]
        ),
        standingSummary: "1st in AFC East"
    )
}

//
//  player_info.swift
//  NBANow
//
//  Created by Dean Martin Garcia on 27/1/26.
//

import SwiftUI
import KingfisherSwiftUI

struct player_info: View {
    @State private var section: InfoSelected = .stats
    
    let team: Team
    let player: Athlete
    
    private var playerStats: [PlayerStats] {
        PlayerDefaultStats(player: player).stats
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                ZStack(alignment: .bottomLeading) {
                    Color(hex: team.color)
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Age: \(player.age)").font(.body).fontWeight(.medium)
                        HStack(spacing: 6) {
                            Text(team.abbreviation).font(.headline).fontWeight(.medium)
                            Text("#\(player.jersey)").font(.headline).fontWeight(.medium)
                            Text(player.position.abbreviation).font(.headline).fontWeight(.medium)
                        }
                        Text(player.fullName).font(.title).fontWeight(.black)
                    }.padding()
                        .foregroundColor(.white)
                    
                    Spacer()
                }.frame(minHeight: 150)
                
                Divider()
                
                VStack(alignment: .leading, spacing: 12) {
                    HStack(spacing: 12) {
                        Spacer()
                        Button(action: { section = .stats }) {
                            Text("STATS")
                                .fontWeight(.bold)
                                .padding(.vertical, 8)
                                .padding(.horizontal, 20)
                                .background(Color(hex: team.color))
                                .foregroundColor(.white)
                                .cornerRadius(25)
                        }
                        
                        Spacer()
                        
                        Button(action: { section = .biography }) {
                            Text("BIO")
                                .fontWeight(.bold)
                                .padding(.vertical, 8)
                                .padding(.horizontal, 20)
                                .background(Color(hex: team.color))
                                .foregroundColor(.white)
                                .cornerRadius(25)
                        }
                        
                        Spacer()
                    }.padding(.horizontal)
                        .padding(.vertical, 8)
                    if section == .stats {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("STATS").font(.title3)
                                .fontWeight(.bold)
                            HStack {
                                        VStack(alignment: .leading, spacing: 8) {

                                            if let s0 = playerStats[safe: 0] {
                                                stat(key: s0.key, value: s0.value)
                                            }
                                            if let s1 = playerStats[safe: 1] {
                                                stat(key: s1.key, value: s1.value)
                                            }
                                            if let s2 = playerStats[safe: 2] {
                                                stat(key: s2.key, value: s2.value)
                                            }
                                        }

                                        Spacer()

                                        VStack(alignment: .leading, spacing: 8) {

                                            if let s3 = playerStats[safe: 3] {
                                                stat(key: s3.key, value: s3.value)
                                            }
                                            if let s4 = playerStats[safe: 4] {
                                                stat(key: s4.key, value: s4.value)
                                            }
                                            if let s5 = playerStats[safe: 5] {
                                                stat(key: s5.key, value: s5.value)
                                            }
                                        }
                                    }
                        }.padding(.horizontal, 16)
                    } else {
                        VStack(alignment: .leading, spacing: 10) {
                                HStack { Text("BIOGRAPHY").bold(); Spacer() }

                                stat(key: "BIRTH", value: "\(player.birthPlace.city), \(player.birthPlace.state)")
                                stat(key: "COUNTRY", value: player.birthPlace.country)
                                stat(key: "COLLEGE", value: player.college.name)
                                stat(key: "MASCOT", value: player.college.mascot)
                                stat(key: "POS", value: player.position.displayName)
                            }
                            .padding(.horizontal)
                            .padding(.top, 8)
                    }
                }
            }.ignoresSafeArea(edges: .top)
        }
    }
}

extension Athlete {
    static let mock = Athlete(
        id: "4373626",
        fullName: "Tyler Allgeier",
        shortName: "T. Allgeier",
        displayWeight: "225 lbs",
        displayHeight: "5' 10\"",
        age: 25,
        birthPlace: BirthPlace(
            city: "Fontana",
            state: "CA",
            country: "USA"
        ),
        college: College(
            id: "252",
            name: "BYU",
            mascot: "Cougars",
            logos: [
                Logo(
                    href: "https://a.espncdn.com/i/playerlogos/ncaa/500/252.png",
                    width: 500,
                    height: 500
                ),
                Logo(
                    href: "https://a.espncdn.com/i/playerlogos/ncaa/500-dark/252.png",
                    width: 500,
                    height: 500
                )
            ]
        ),
        jersey: "25",
        position: Position(
            id: "9",
            displayName: "Running Back",
            abbreviation: "RB",
            parent: ParentPosition(
                id: "70",
                displayName: "Offense"
            )
        ),
        experience: YearsActive(years: 4)
    )
}

extension Team {
    
    static let secondMock = Team(
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

struct player_info_Previews: PreviewProvider {
    static var previews: some View {
        player_info(team: .secondMock, player: .mock)
    }
}


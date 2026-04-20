import Foundation

enum ScreenshotDemoData {
    static let teamID = "demo-dal"
    static let teamLogo = "https://a.espncdn.com/i/teamlogos/nfl/500/dal.png"
    static let opponentLogo = "https://a.espncdn.com/i/teamlogos/nfl/500/phi.png"

    static let favoriteTeams: [String] = [teamID]
    static let favoritePlayers: [CreatedPlayer] = [
        CreatedPlayer(
            id: "demo-player-1",
            name: "Jordan Hayes",
            age: 24,
            jerseyNumber: "12",
            position: .qb,
            team: .dal,
            avatar: .star
        )
    ]

    static let teams: [Team] = [
        demoTeam,
        Team(
            id: "demo-phi",
            abbreviation: "PHI",
            displayName: "Philadelphia Eagles",
            shortDisplayName: "Eagles",
            location: "Philadelphia",
            color: "004C54",
            alternateColor: "A5ACAF",
            logos: [LogoItem(href: opponentLogo)],
            franchise: Franchise(
                id: "demo-phi-franchise",
                name: "Philadelphia Eagles",
                venue: Venue(fullName: "Lincoln Financial Field")
            ),
            record: demoRecord(wins: "7", losses: "3", ties: "0", against: "6.2", for: "24.8", average: "358.1", pointsFor: "248", pointsAgainst: "176", winPct: "0.700"),
            standingSummary: "2nd in NFC East"
        )
    ]

    static let roster: Roster = Roster(
        team: RosterTeam(
            id: teamID,
            abbreviation: "DAL",
            location: "Dallas",
            name: "Cowboys",
            displayName: "Dallas Cowboys",
            clubhouse: "AT&T Stadium",
            color: "041E42",
            logo: teamLogo,
            recordSummary: "8-3-0",
            seasonSummary: "2026 Regular Season",
            standingSummary: "1st in NFC East"
        ),
        athletes: [
            AthleteGroup(
                position: "QB",
                items: [
                    Athlete(
                        id: "demo-athlete-1",
                        fullName: "Dak Prescott",
                        age: 31,
                        jersey: "4",
                        position: Position(abbreviation: "QB", displayName: "Quarterback"),
                        headshot: Headshot(href: "https://a.espncdn.com/i/headshots/nfl/players/full/2577417.png")
                    )
                ]
            ),
            AthleteGroup(
                position: "RB",
                items: [
                    Athlete(
                        id: "demo-athlete-2",
                        fullName: "Tony Pollard",
                        age: 27,
                        jersey: "20",
                        position: Position(abbreviation: "RB", displayName: "Running Back"),
                        headshot: Headshot(href: "https://a.espncdn.com/i/headshots/nfl/players/full/4241476.png")
                    )
                ]
            )
        ]
    )

    static let scoreboard: ScoreBoardResponse = ScoreBoardResponse(
        season: Season(type: 2, year: 2026),
        week: Week(number: 8),
        events: [
            Event(
                id: "demo-event-1",
                uid: "demo-event-uid-1",
                date: "2026-10-26T20:20Z",
                name: "Philadelphia Eagles at Dallas Cowboys",
                shortName: "PHI @ DAL",
                competitions: [
                    Competition(
                        id: "demo-competition-1",
                        uid: "demo-competition-uid-1",
                        date: "2026-10-26T20:20Z",
                        attendance: 80500,
                        neutralSite: false,
                        venue: Venue(fullName: "AT&T Stadium"),
                        competitors: [
                            Competitor(
                                id: "demo-competitor-away",
                                homeAway: "away",
                                winner: false,
                                team: TeamMini(
                                    id: "demo-phi",
                                    abbreviation: "PHI",
                                    displayName: "Philadelphia Eagles",
                                    logo: opponentLogo
                                ),
                                score: "21",
                                linescores: [
                                    LineScore(value: 7, displayValue: "7", period: 1),
                                    LineScore(value: 7, displayValue: "7", period: 2),
                                    LineScore(value: 7, displayValue: "7", period: 3),
                                    LineScore(value: 0, displayValue: "0", period: 4)
                                ]
                            ),
                            Competitor(
                                id: "demo-competitor-home",
                                homeAway: "home",
                                winner: true,
                                team: TeamMini(
                                    id: teamID,
                                    abbreviation: "DAL",
                                    displayName: "Dallas Cowboys",
                                    logo: teamLogo
                                ),
                                score: "28",
                                linescores: [
                                    LineScore(value: 7, displayValue: "7", period: 1),
                                    LineScore(value: 7, displayValue: "7", period: 2),
                                    LineScore(value: 7, displayValue: "7", period: 3),
                                    LineScore(value: 7, displayValue: "7", period: 4)
                                ]
                            )
                        ],
                        status: Status(
                            type: TypeStatus(id: "2", description: "Final")
                        )
                    )
                ],
                status: Status(
                    type: TypeStatus(id: "2", description: "Final")
                )
            )
        ]
    )

    static let teamDetail: Team = demoTeam

    private static let demoTeam: Team = Team(
        id: teamID,
        abbreviation: "DAL",
        displayName: "Dallas Cowboys",
        shortDisplayName: "Cowboys",
        location: "Dallas",
        color: "041E42",
        alternateColor: "869397",
        logos: [LogoItem(href: teamLogo)],
        franchise: Franchise(
            id: "demo-dal-franchise",
            name: "Dallas Cowboys",
            venue: Venue(fullName: "AT&T Stadium")
        ),
        record: demoRecord(wins: "8", losses: "3", ties: "0", against: "4.5", for: "28.4", average: "369.2", pointsFor: "313", pointsAgainst: "210", winPct: "0.727"),
        standingSummary: "1st in NFC East"
    )

    private static func demoRecord(
        wins: String,
        losses: String,
        ties: String,
        against: String,
        for: String,
        average: String,
        pointsFor: String,
        pointsAgainst: String,
        winPct: String
    ) -> Record {
        Record(
            items: [
                RecordItem(type: "team", summary: "\(wins)-\(losses)-\(ties)", stats: [
                    RecordStat(name: "gamesBehind", value: 0),
                    RecordStat(name: "division", value: 1),
                    RecordStat(name: "against", value: Double(against) ?? 0),
                    RecordStat(name: "for", value: Double(for) ?? 0),
                    RecordStat(name: "average", value: Double(average) ?? 0),
                    RecordStat(name: "pointsFor", value: Double(pointsFor) ?? 0),
                    RecordStat(name: "pointsAgainst", value: Double(pointsAgainst) ?? 0),
                    RecordStat(name: "streak", value: 0),
                    RecordStat(name: "pct", value: Double(winPct) ?? 0),
                    RecordStat(name: "wp", value: Double(winPct) ?? 0)
                ])
            ]
        )
    }
}

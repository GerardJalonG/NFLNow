import Foundation

//teams: id, abbreviation, displayName, location, color, alternateColor, logos ->0 href,
//teamDetail{id}: franchise -> venue -> fullName, nextEvent[...]

struct Root: Codable {
    let sports: [Sport]
}

struct Sport: Codable {
    let id: String
    let slug: String
    let leagues: [League]
}

struct League: Codable {
    let id: String
    let slug: String
    let teams: [TeamContainer]
}

struct TeamContainer: Codable {
    let team: Team
}

struct Team: Codable, Identifiable  {
    let id: String
    let abbreviation: String
    let displayName: String
    let shortDisplayName: String
    let location: String
    let color: String
    let alternateColor: String
    let logos: [LogoItem]
    var franchise: Franchise?
    var record: Record?
    var standingSummary: String?
    var conference: String {
            guard let conferencia = standingSummary else { return "" }
            if conferencia.contains("NFC") { return "NFC" }
            if conferencia.contains("AFC") { return "AFC" }
            return ""
        }
}

extension Team {
    static let mockTeams: [Team] = [
        Team(
            id: "1",
            abbreviation: "ATL",
            displayName: "Atlanta Falcons",
            shortDisplayName: "Falcons",
            location: "Atlanta",
            color: "a71930",
            alternateColor: "000000",
            logos: [LogoItem(href: "https://a.espncdn.com/i/teamlogos/nfl/500/atl.png")],
            franchise: nil,
            record: nil,
            standingSummary: "1st in NFC South"
        ),
        Team(
            id: "2",
            abbreviation: "DAL",
            displayName: "Dallas Cowboys",
            shortDisplayName: "Cowboys",
            location: "Dallas",
            color: "041e42",
            alternateColor: "869397",
            logos: [LogoItem(href: "https://a.espncdn.com/i/teamlogos/nfl/500/dal.png")],
            franchise: nil,
            record: nil,
            standingSummary: "2nd in NFC East"
        ),
        Team(
            id: "3",
            abbreviation: "SF",
            displayName: "San Francisco 49ers",
            shortDisplayName: "49ers",
            location: "San Francisco",
            color: "aa0000",
            alternateColor: "b3995d",
            logos: [LogoItem(href: "https://a.espncdn.com/i/teamlogos/nfl/500/sf.png")],
            franchise: nil,
            record: nil,
            standingSummary: "1st in NFC West"
        ),
        Team(
            id: "4",
            abbreviation: "KC",
            displayName: "Kansas City Chiefs",
            shortDisplayName: "Chiefs",
            location: "Kansas City",
            color: "e31837",
            alternateColor: "ffb81c",
            logos: [LogoItem(href: "https://a.espncdn.com/i/teamlogos/nfl/500/kc.png")],
            franchise: nil,
            record: nil,
            standingSummary: "1st in AFC West"
        ),
        Team(
            id: "5",
            abbreviation: "BUF",
            displayName: "Buffalo Bills",
            shortDisplayName: "Bills",
            location: "Buffalo",
            color: "00338d",
            alternateColor: "c60c30",
            logos: [LogoItem(href: "https://a.espncdn.com/i/teamlogos/nfl/500/buf.png")],
            franchise: nil,
            record: nil,
            standingSummary: "2nd in AFC East"
        ),
        Team(
            id: "6",
            abbreviation: "CIN",
            displayName: "Cincinnati Bengals",
            shortDisplayName: "Bengals",
            location: "Cincinnati",
            color: "fb4f14",
            alternateColor: "000000",
            logos: [LogoItem(href: "https://a.espncdn.com/i/teamlogos/nfl/500/cin.png")],
            franchise: nil,
            record: nil,
            standingSummary: "3rd in AFC North"
        )
    ]
}

struct TeamDetail: Codable {
    let team: Team
}

struct LogoItem: Codable {
    let href: String
}

struct Franchise: Codable {
    let id: String
    let fullName: String
    let venue: Venue
}

struct Record: Codable {
    let items: [RecordItem]
}

struct RecordItem: Codable {
    let type: String
    let summary: String
    let stats: [RecordStat]
}

struct RecordStat: Codable {
    let name: String
    let value: Double
}

struct Venue: Codable {
    let fullName: String
    let address: Address
}

struct Address: Codable {
    let city: String
    let state: String
}

import Foundation

//teams: id, abbreviation, displayName, location, color, alternateColor, logos ->0 href,
//teamDetail{id}: franchise -> venue -> fullName, nextEvent[...]

struct TeamResponse: Codable {
    let team: Team
}

struct Team: Codable {
    let id: String
    let abbreviation: String
    let displayName: String
    let shortDisplayName: String
    let location: String
    let color: String
    let alternateColor: String
    //let logos: Logo?
    let franchise: Franchise
    let record: Record
    let standingSummary: String
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
